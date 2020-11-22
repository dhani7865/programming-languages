// Creating ArithmeticTaskRunner

// Creating ArithmeticTaskRunner class
class ArithmeticTaskRunner {
    // Creating an instance variable named tasks which is initialised to an empty array.
    constructor() {
        this.tasks = [];
    } // CLose instance variable tasks

    // Creating a method method for addAdditionTask, which takes in a single argument y, and then adds an anonymous function to the tasks array.  This anonymous function takes one argument, x, and returns the result x + y. 
    addAdditionTask(y) {
        this.tasks.push(function(x) {
            return y + x;
        }); // Close function
    } // CLose addAdditionTask method

    // Creating a method for addMultiplicationTask which takes a single argument y, and adds an anonymous function to the tasks array.  This anonymous function takes one argument, x, and returns the result x * y. 
    addMultiplicationTask(y) {
        this.tasks.push(function(x) {
            return y * x; // return y*x
        }); // Close function
    } // CLose addMultiplicationTask method
    
    // Creating a method for addNegationTask, which adds an anonymous function to the tasks array.  This anonymous function  takes one argument, x, and returns the negation, -x. 
    addNegationTask() {
        this.tasks.push(function(x) {
            return -1 * x; // returns -1 * x
        }); // Close function
    } // Close addNegationTask method

    // Creating a method for execute, which takes a single argument named startValue.  If it's omitted, startValue would default to zero.  Starting at startValue, this method iterates over the tasks array executing each function on the current value.  It then returns the resulting number after all arithmetic operations have been executed. 
    execute(temp=0) {
	var temp = temp;
        for (var i = 0; i < this.tasks.length; i++) {
            temp = this.tasks[i](temp);
        } // CLose foor loop and return the temp
        return temp;
    } // CLose execute task count
    
    // gets the task count
    get taskCount() {
        // Return this task length
        return this.tasks.length;
    } // Close task count method
} // Close ArithmeticTaskRunner class 

// Calling the taskRunner class
var taskRunner = new ArithmeticTaskRunner();
// Adding addition task of 10 for the task runner
taskRunner.addAdditionTask(10);
// Adding negation task for the task runner
taskRunner.addNegationTask();
// Adding add multiply task 0.5 for the task runner
taskRunner.addMultiplicationTask(0.5);
// Output and execute the 
console.log(taskRunner.execute())