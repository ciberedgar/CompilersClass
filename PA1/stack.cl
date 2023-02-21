(*
 *  Compilers Course @Facultad de Ciencias UABC 2023 (Based on Berkley's CS164 Spring 2004)
 *  Student: Edgar Rodriguez Antillon
 *  Teacher: Everardo Gutierrez Lopez
 *
 *  Programming Assignment 1
 *  Implementation of a simple stack machine.
 *
 *  
 *)

class Stack{

	isNil() : Bool { true }; --True if isNil

   pop()  : String { { ""; ""; } }; --If isNil pop will abort

   rest()  : Stack { { abort(); self; } }; --If isNil rest will abort

   peek()  : String { { ""; ""; } }; --If isNil peek will abort

   push(i : String) : Stack {
      (new Push).init(i, self)
   };
};

class Push inherits Stack {
   --Attributes
	head : String; -- Head of current Stack

	tail: Stack; -- Tail is the current Stack object

	tempElement : String; --Flag used in pop()
	
   --Methods
   rest() : Stack {tail}; --Returns the rest of the stack without the first element.
	
	isNil() : Bool { false }; --Returns false when not Nil
	
	peek() : String { head }; -- Returns head of the stack
	
	pop() : String { --Pops and returns the head of the stack
		{
			tempElement <- peek(); -- Assign head to a temp attr for return.
         if not tail.isNil() then {
         head <- tail.peek(); -- Assign new head (peek checks the head of the Stack)
         tail <- tail.rest(); -- Assign new tail (Stack without head)
         }
         else{head <- "";}
         fi;
			tempElement; -- Return the temporary attribute
		}
	};
	
	init(s: String, rest : Stack) : Stack {
		{
			head <- s; -- Insert initial head
			tail <- rest; -- Stack object
			self; -- Return self
		}
	};
};

class Main inherits IO {
	input : String;
   myStack : Stack; --Create Stack object
   x1 : String; --Used as flag for swap and sum
   x2 : String; --Used as flag for swap and sum
   
   --Method for printing a Stack
   print_stack(s : Stack) : Object {
      if s.isNil() then out_string("\n")
                   else {
	 while (not s.isNil()) loop
	    {
               out_string(s.peek());
               s <- s.rest();
               out_string("\n");
	    }
       pool;
		        }
      fi
   };

   main() : Object {
      {
         --Initial push
         out_string("\nCommand: ");
         input <- in_string();
         myStack <- new Stack.push(input);

         --Loop for waiting commands (will stop if stack is empty or if a sum > 9)
         while (not input="x") loop{
            out_string("\nCommand: "); --Promt to write a command
            input <- in_string(); 
            if input = "+" then {myStack <- myStack.push("+");}
            else if input = "s" then {myStack <- myStack.push("s");}
            else if input = "e" then { --Evaluation case
               if myStack.peek() = "s" then{
                  myStack.pop(); --Pops the S value first
                  x1 <- myStack.pop();
                  x2 <- myStack.pop();
                  --Pops out the first 2 elements to do a swap between them.
                  myStack <- myStack.push(x1);
                  myStack <- myStack.push(x2);
                  }
               else if myStack.peek() = "+" then{ --Sum case
                  myStack.pop(); --Pops the + value first
                  x1 <- myStack.pop();
                  x2 <- myStack.pop();
                  --Pops out the first 2 elements to do the sum.
                  (let x: Int <- new A2I.a2i(x1) in(--Converts the Strings to Ints (atoi.cl)
                  let y: Int <- new A2I.a2i(x2) in (
                  let res: String <- new A2I.i2a(x + y) in ( --Converts Int to String (atoi.cl)
                  myStack <- myStack.push(res)
                  ))));
                  }
               else {
                  out_string("\nNothing to evaluate... ");
               }
               fi fi;
               } 
            else if input = "d" then {print_stack(myStack);} --Calls print method
            else if input = "x" then abort() --Exits the program
            else {myStack <- myStack.push(input);} --Waits for any input
            fi fi fi fi fi;
         }
         pool;
      }
   };

};