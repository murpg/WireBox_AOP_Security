This application has been updated to ColdBox4.3.

WireBox AOP allows you to dynamically add code known as an "aspect" to methods to easily change how they behave at runtime.  This is done with minimal configuration and little to no changes in the target method itself.  Aspects "wrap" the execution of methods so they can provide their logic before and after the original method.  This is all done seamlessly by WireBox.

In this example, we have written a simple aspect that auto-binds itself to any method that uses the annotation "secure".  You can see that we have completely decoupled the security of our application into a separate CFC.  This helps simplify the rest of the application, and adding new secure methods is a snap since all you need to do is specify the "secure" annotation.

To use this sample app, try hitting the secure page while logged in and logged out to see what happens.  You'll see there is no security-related code in our handler-- just the annotation that our aspect binds to.  This is all possible with WireBox.  Since it creates all our objects, it can wrap them with the AOP advice for us. 