import UIKit
import RxSwift

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}

// PublishSubject 구독 이후에, 생성된 이벤트를 전달한다.
let subject = PublishSubject<String>()

// 그러므로 이전에 있었던 이벤트는 전달하지 않는다.
subject.onNext("Hello")

// 그래서 여기서 아래 구독을 추가해도 아무런 이벤트가 발생하지 않는다.
let observer01 = subject.subscribe { print("첫 번째 구독자", $0) }
observer01.disposed(by: disposeBag)

// 구독 이후에, 이벤트를 전달했기 때문에, 여기서부터는 전달이 된다.
subject.onNext("RxSwift")

let observer02 = subject.subscribe { print("두 번째 구독자", $0)}
observer02.disposed(by: disposeBag)
// 여기까지만 작성하면 이벤트가 전달되지 않는다.
// 이유는 구독 전에 있었던 이벤트이기 때문이다.

// 이제는 o1 o2 모두 구독하고 있는 상태이다.
// 그래서 여기에서 subject에서 이벤트를 발행하면 모두 추가된다.
subject.onNext("Subject")

// completed 이벤트를 전달한다.
//subject.onCompleted()

// error 이벤트를 전달한다.
subject.onError(MyError.error)

// 이벤트는 모두 이전에 추가되었다. 그리고 Completed 이벤트가 전달된 상태에서
// 새로운 것 구독자가 subject를 구독한다면 어찌될까?
let observer03 = subject.subscribe { print("세 번째 구독자", $0)}
observer03.disposed(by: disposeBag)
// completed가 호출되었다면 더이상 전달할 Next 이벤트가 없다.
// 그러므로 completed를 전달하여 바로 종료한다. (error 또한 마찬가지)




