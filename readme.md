# ConcurrencyDemo
> iOS Concurrency: Getting Started with NSOperation and Dispatch Queues in Swift3

Demo ScreenShot

![App ScreenShot](http://7xqacx.com1.z0.glb.clouddn.com/app_screen_shot.png)

GCD Cheatsheet

![GCD cheatsheet](http://7xqacx.com1.z0.glb.clouddn.com/gcd-cheatsheet.png)


### Dispatch Queues
> 1. serial queues
> 2. concurrent queues

1. Serial queues:
  * Guaranteed serialized access to a shared resource that avoids race condition.
  * Tasks are executed in a predictable order. When you submit tasks in a serial dispatch queue, they will be executed in the same order as they are inserted.
  * You can create any number of serial queues.
2. Concurrent Queues:
  * As the name suggests, concurrent queues allows you to execute multiple tasks in parallel. The tasks (blocks of codes) starts in the order in which they are added in the queue. But their execution all occur concurrently and they don’t have to wait for each other to start. Concurrent queues guarantee that tasks start in same order but you will not know the order of execution, execution time or the number of tasks being executed at a given point.


### Advantages of NSOperation

1. First, they support dependencies through the method addDependency(op: NSOperation) in the NSOperation class.
When you need to start an operation that depends on the execution of the other, you will want to use NSOperation.

2. Secondly, you can change the execution priority by setting the property queuePriority with one of these values:
```
public enum NSOperationQueuePriority : Int {
    case VeryLow
    case Low
    case Normal
    case High
    case VeryHigh
}
```

3. You can cancel a particular operation or all operations for any given queue. The operation can be cancelled after being added to the queue. Cancellation is done by calling method cancel() in the NSOperation class. When you cancel any operation, we have three scenarios that one of them will happen:
  * Your operation is already finished. In that case, the cancel method has no effect.
  * Your operation is already being executing. In that case, system will NOT force your operation code to stop but instead, cancelled property will be set to true.
  * Your operation is still in the queue waiting to be executed. In that case, your operation will not be executed.

4. NSOperation has 3 helpful boolean properties which are finished, cancelled, and ready. finished will be set to true once operation execution is done. cancelled is set to true once the operation has been cancelled. ready is set to true once the operation is about to be executed now.

5. Any NSOperation has an option to set completion block to be called once the task being finished. The block will be called once the property finished is set to true in NSOperation.
