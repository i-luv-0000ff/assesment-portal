package com.portal.util;

/**
 * Constant values for SQL Scripts.
 * 
 * @author Rajkumar Kathiresan.
 *
 */
public class SQLConst {

	/** Categories related Queries */
	public static final String findAllCategories = "SELECT * FROM AP.TBLCATEGORY";

	public static final String findCategoryById = "SELECT * FROM AP.TBLCATEGORY WHERE CATEGORY_ID = ?";

	public static final String createCategory = "INSERT INTO AP.TBLCATEGORY (CATEGORY_NAME,DESCRIPTION,CUT_OFF,MAX_ATTEMPT) VALUES(?,?,?,?)";

	public static final String deleteCategoryById = "DELETE FROM AP.TBLCATEGORY WHERE CATEGORY_ID = ?";

	public static final String updateCategoryById = "UPDATE AP.TBLCATEGORY SET CATEGORY_NAME = ?, DESCRIPTION = ?, CUT_OFF = ?, MAX_ATTEMPT = ? WHERE CATEGORY_ID = ?";

	/** Questions related Queries */

	public static final String findAllQuestions = "SELECT * FROM AP.TBLQUESTION";

	public static final String findQuestionById = "SELECT * FROM AP.TBLQUESTION WHERE QUESTION_ID = ?";

	public static final String findQuestionByCategoryId = "SELECT * FROM AP.TBLQUESTION WHERE CATEGORY_ID = ?";

	public static final String createQuestion = "INSERT INTO AP.TBLQUESTION (QUESTION_DESC,ANSWER_TYPE_ID,CATEGORY_ID,COMPLEXITY) VALUES(?,?,?,?)";

	public static final String deleteQuestionById = "DELETE FROM AP.TBLQUESTION WHERE QUESTION_ID = ?";

	public static final String deleteQuestionByCategoryId = "DELETE FROM AP.TBLQUESTION WHERE CATEGORY_ID = ?";

	public static final String updateQuestionById = "UPDATE AP.TBLQUESTION SET QUESTION_DESC = ?, ANSWER_TYPE_ID = ?,CATEGORY_ID = ?, COMPLEXITY = ? WHERE QUESTION_ID = ?";

	/** Options related Queries */

	public static final String findAllOptions = "SELECT * FROM AP.TBLOPTIONS";

	public static final String findOptionsById = "SELECT * FROM AP.TBLOPTIONS WHERE OPTION_ID = ?";

	public static final String findOptionsByQuestionId = "SELECT * FROM AP.TBLOPTIONS WHERE QUESTION_ID = ?";

	public static final String createOptions = "INSERT INTO AP.TBLOPTIONS (QUESTION_ID,OPTION_DESC,CORRECT_ANSWER) VALUES(?,?,?)";

	public static final String deleteOptionsById = "DELETE FROM AP.TBLOPTIONS WHERE OPTION_ID = ?";

	public static final String deleteOptionsByQuestionId = "DELETE FROM AP.TBLOPTIONS WHERE QUESTION_ID = ?";

	public static final String updateOptionsById = "UPDATE AP.TBLOPTIONS SET QUESTION_ID = ?, OPTION_DESC = ?,CORRECT_ANSWER = ? WHERE OPTION_ID = ?";
	
	public static final String getNotApplicableAssessements = "select count(activity.category_id) AttemptsTaken from AP.tbluseractivity activity where activity.user_id= ? and activity.category_id = ? ";
	
	public static final String getMaximumAttemptsPerCategory = " select max(no_attempt) MaximumAttempts, category_id from AP.tblattempt group by category_id ";
	
	public static final String updateQuestionsPerCategory = "UPDATE AP.tblattempt SET NO_QUESTION= ?, TIME= ? WHERE NO_ATTEMPT = ? AND CATEGORY_ID= ? ";
	
	public static final String insertQuestionsPerCategory = "INSERT INTO AP.tblattempt (CATEGORY_ID, NO_ATTEMPT, NO_QUESTION , time) VALUES (?, ? , ?, ?)";
	
	public static final String updateComplexityPerAttempts = "update ap.tblcomplexitylookup set percentage = ? where no_attempt= ? and complexity = ? and category_id=? ";
	
	public static final String insertComplexityPerAttempts = "INSERT INTO ap.tblcomplexitylookup(CATEGORY_ID, COMPLEXITY, NO_ATTEMPT, PERCENTAGE) VALUES (?,?,?,?)";
	
	/* Complexity max */
	public static final String complexityMax = "select count(*) as complexity from ap.tblcomplexity";
	public static final String deleteComplexityByCategoryId = "DELETE FROM AP.TBLCOMPLEXITYLOOKUP WHERE CATEGORY_ID = ?";
	public static final String deleteAttemptsByCategoryId = "DELETE FROM AP.TBLATTEMPT WHERE CATEGORY_ID = ?";
	
	/** Look up table related queries */
	public static final String findAllAnswerTypes = "SELECT * FROM AP.TBLANSWERTYPELOOKUP";
	public static final String findAllComplexityTypes = "SELECT * FROM AP.TBLCOMPLEXITY";
	

	/*Security Question - Registration*/
	public static final String securityQuestions = "Select securityquestnumber, securityquestions from ap.tblsecurityquestion";
	
	public static final String createUser = "Insert into AP.tblusers (user_name, password, user_role, email, securityQuestNumber, securityAnswer) VALUES (?,?,?,?,?,?)";
	
	public static final String compareUserName = "Select user_name from ap.tblusers where user_name = ?";
	
	
	/*Change Password*/

	public static final String updatePassword = "UPDATE AP.TBLUSERS SET PASSWORD = ? WHERE USER_NAME = ?";

}
