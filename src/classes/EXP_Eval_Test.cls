/**
 * Class EXP_Eval_Test
 * Test class for EXP_Eval - Math compare expresion Evaluation class function as
 * Eval() method to check string expression results
 * 
 * Author: A.I.
 * Ver: 1.0
 */
@isTest
private class EXP_Eval_Test {
    @isTest 
    static void testEval() {
    
        System.assertEquals(15.0,   EXP_Eval.mathEval(new List<Object> {10,5,'+'}));
        System.assertEquals(5.0,   EXP_Eval.mathEval(new List<Object> {10,5,'-'}));
        System.assertEquals(8.0,   EXP_Eval.mathEval(new List<Object> {2,4,'*'}));
        System.assertEquals(2.0,   EXP_Eval.mathEval(new List<Object> {10,5,'/'}));
        System.assertEquals(1.0,   EXP_Eval.mathEval(new List<Object> {10,5,'>'}));
        System.assertEquals(0.0,   EXP_Eval.mathEval(new List<Object> {4,5,'>'}));
    	System.assertEquals(0.0,   EXP_Eval.mathEval(new List<Object> {10,5,'<'}));
        System.assertEquals(1.0,   EXP_Eval.mathEval(new List<Object> {4,5,'<'}));
    	System.assertEquals(1.0,   EXP_Eval.mathEval(new List<Object> {3,3,'>='}));
        System.assertEquals(0.0,   EXP_Eval.mathEval(new List<Object> {3,6,'>='}));
		System.assertEquals(1.0,   EXP_Eval.mathEval(new List<Object> {3,5,'<='}));
        System.assertEquals(0.0,   EXP_Eval.mathEval(new List<Object> {3,1,'<='}));
		System.assertEquals(1.0,   EXP_Eval.mathEval(new List<Object> {3,3,'=='}));
        System.assertEquals(0.0,   EXP_Eval.mathEval(new List<Object> {3,1,'=='}));
    	System.assertEquals(1.0,   EXP_Eval.mathEval(new List<Object> {3,5,'!='}));
        System.assertEquals(0.0,   EXP_Eval.mathEval(new List<Object> {3,3,'!='}));
        
        System.assertEquals(1.0,   EXP_Eval.textEval(new List<Object> {'Tree','Tree','=='}));
		System.assertEquals(0.0,   EXP_Eval.textEval(new List<Object> {'Tee','Foset','=='}));
        System.assertEquals(0.0,   EXP_Eval.textEval(new List<Object> {'Test','Test','!='}));
		System.assertEquals(1.0,   EXP_Eval.textEval(new List<Object> {'Test','Tesla','!='}));
        System.assertEquals(1.0,   EXP_Eval.textEval(new List<Object> {'My Test Run','Test','contains'}));
		System.assertEquals(0.0,   EXP_Eval.textEval(new List<Object> {'My Car Test','Tesla','contains'}));  
    }

}