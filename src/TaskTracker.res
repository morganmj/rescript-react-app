@react.component
let make = () => {
  open Belt

  let (showAddTask, setShowAddTask) = React.useState(() => false)

  let toogleShowAddTask = () => setShowAddTask(prev => !prev)

  let todos = Hooks.useObservableValue(Task.defaultTasksSubject, Task.defaultTasks)

  let addTask = task => Task.defaultTasksSubject->Rxjs.next(todos->Array.concat([task]))

  let deleteTask = id =>
    Task.defaultTasksSubject->Rxjs.next(todos->Js.Array2.filter(task => task.id !== id))

  let toggleReminder = id =>
    Task.defaultTasksSubject->Rxjs.next(
      todos->Js.Array2.map(task => {
        if task.id === id {
          {
            ...task,
            reminder: !task.reminder,
          }
        } else {
          task
        }
      }),
    )

  <div>
    <Header title={"Task Tracker"} toogleShowAddTask showAddTask />
    {if showAddTask {
      <AddTask addTask />
    } else {
      React.null
    }}
    <div>
      {React.array(
        todos->Js.Array2.map(task => <Task key={task.id} task toggleReminder deleteTask />),
      )}
    </div>
  </div>
}
