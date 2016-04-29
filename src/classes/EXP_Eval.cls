/**
 * Class EXP_Eval
 * Math compare expresion Evaluation class function as
 * Eval() method to check string expression results
 * 
 * Author: A.I.
 * Ver: 1.0
 */
public class EXP_Eval {

   /**
	* textEval method calculates/evaluates a numeric expression 
	* using reverse polish notation.
    * Each stack element is either a decimal or a string operator (+ - * or / )
    * Example [0] 35 [1] 7 [2] / divides 35 by 7, returning 5
    * 
    * return: Decimal value esultof math calculation or 1/0 Boolean TRUE/FALSE
	*/
    public static Decimal mathEval(Object[] rpnExprStack) {
    	
    	Decimal res = 0;
    	List<Object> workRpnExprStack = new List<Object> ();
        for (Object obj : rpnExprStack) {    // make copy of stack as we'll be modifying it
        	workRpnExprStack.add(obj);
        }
    	while (workRpnExprStack.size() > 1) {
        	Object expr0 = workRpnExprStack[0];
        	Object expr1 = workRpnExprStack[1];
        	Object expr2 = workRpnExprStack.size() > 2 ? workRpnExprStack[2] : null;
        	//  dec dec operator, operator expr, dec operator, or dec operator expr
        	if (expr0 instanceof String){
          	  System.debug(rpnExprStack);
              throw new EXPException('Invalid RPN expression stack (dangling operator): ' + rpnExprStack);
        	}
            // Evaluate Number expression
        	if (expr0 instanceOf Decimal && expr1 instanceOf Decimal && expr2 instanceOf String) {
            	String operator = (String) expr2;
                if (operator == '+') {
                	res = (Decimal) expr0 + (Decimal) expr1;
                } else if (operator == '-') {
                	res     = (Decimal) expr0 - (Decimal) expr1;
                } else if (operator == '*') {
                	res     = (Decimal) expr0 * (Decimal) expr1;
                } else if (operator == '/') {
                	res     = (Decimal) expr0 / (Decimal) expr1;
                } else if (operator == '>=') {
                	if((Decimal) expr0 >= (Decimal) expr1){
                    	res = 1;
                	} else { res = 0; }  
            	} else if (operator == '<=') {
                	if((Decimal) expr0 <= (Decimal) expr1){
                    	res = 1;
                	} else { res = 0; }  
            	} else if (operator == '>') {
                	if((Decimal) expr0 > (Decimal) expr1){
                    	res = 1;
                	} else { res = 0; }  
            	} else if (operator == '<') {
                	if((Decimal) expr0 < (Decimal) expr1){
                    	res = 1;
                	} else { res = 0; }  
            	} else if (operator == '==') {
                	if ((Decimal) expr0 == (Decimal) expr1) {
                    	res = 1;
                	} else { res = 0; }  
            	} else if (operator == '!=') {
                	if ((Decimal) expr0 != (Decimal) expr1){
                    	res = 1;
                	} else { res = 0; }  
            	} else {
                	System.debug(rpnExprStack);
                	throw new EXPException('Invalid RPN expression stack (unsupported operator): ' + rpnExprStack);
            	}
            	workRpnExprStack.remove(0); // pop expr 0
            	workRpnExprStack.remove(0); // pop expr 1
            	workRpnExprStack.remove(0); // pop operator
                if (workRpnExprStack.size() > 0) {
                	workRpnExprStack.add(0,res);// push res to front of stack
                } else {
                	workRpnExprStack.add(res); 
                }
        	} else {
            	System.debug(rpnExprStack);
            	throw new EXPException('Invalid RPN expression stack (expressions/operators): ' + rpnExprStack);
        	}
    	}
    	res = (Decimal) workRpnExprStack[0];
    	return res;
	}

   /** 
	* textEval method evaluates a string expression using reverse polish notation
    * Each stack element is either a string
    * Example [0] 'Test' [1] 'Tesla' [2] == compare 2 strings, returning 0, not equal.
    * 
    * return: 1/0 TRUE/FALSE
	*/
	public static Decimal textEval(Object[] rpnExprStack) {
    	Decimal res = 0;
    	List<Object> workRpnExprStack = new List<Object> ();
        for (Object obj : rpnExprStack) {    // make copy of stack as we'll be modifying it
        	workRpnExprStack.add(obj);
        }
    	while (workRpnExprStack.size() > 1) {
        	Object expr0 = workRpnExprStack[0];
        	Object expr1 = workRpnExprStack[1];
        	Object expr2 = workRpnExprStack.size() >2 ? workRpnExprStack[2] : null;
        	//  we either have dec dec operator, operator expr, dec operator, or dec operator expr
        	if (expr0 instanceof Decimal){
          	  System.debug(rpnExprStack);
              throw new EXPException('Invalid RPN expression stack (dangling operator): ' + rpnExprStack);
        	}
            // Evaluate lmited String Expression
            if (expr0 instanceOf String && expr1 instanceOf String && expr2 instanceOf String) {
            	String operator = (String) expr2;
                String exp0 = (String)expr0;
                String exp1 = (String) expr1;
                if (operator == '==') {
                    if(exp0.equals( exp1) ) {
                		res = 1;
                    } else { res = 0; }
                } else if (operator == '!=') {
                    if (!exp0.equals( exp1) ) {
                		res = 1;
                    } else { res = 0; }
            	} else if (operator.equals('contains')){
                    if (exp0.contains( exp1) ) {
                		res = 1;
                    } else { res = 0; }
                } else {
                	System.debug(rpnExprStack);
                	throw new EXPException('Invalid RPN expression stack (unsupported operator): ' + rpnExprStack);
            	}
            	workRpnExprStack.remove(0); // pop expr 0
            	workRpnExprStack.remove(0); // pop expr 1
            	workRpnExprStack.remove(0); // pop operator
            	if (workRpnExprStack.size() > 0)
                	workRpnExprStack.add(0,res);// push res to front of stack
           	 	else
                	workRpnExprStack.add(res);      
        	}   
        	else{
            	System.debug(rpnExprStack);
            	throw new EXPException('Invalid RPN expression stack (expressions/operators): ' + rpnExprStack);
        	}
    	}
    	res     = (Decimal) workRpnExprStack[0];
    	return res;
	}
    
    public class EXPException extends Exception {}
    
}