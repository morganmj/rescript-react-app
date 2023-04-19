@uncurry
let useObservableValue = (
  source: Rxjs.t<'class, 'c, 'b>,
  initialValue: 'b,
) => {
  let (value, setValue) = React.useState(_ => initialValue)

  React.useEffect2(() => {
    let subscription = source->Rxjs.subscribe(
      Rxjs.Observer.make(
        ~next=x => {
          setValue(_ => x)
        },
        ~error=err => Js.Console.error(err),
        (),
      ),
    )

    Some(() => Rxjs.unsubscribe(subscription))
  }, (source, setValue))

  value
}
