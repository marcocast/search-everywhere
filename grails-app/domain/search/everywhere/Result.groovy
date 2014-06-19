package search.everywhere

class Result {

	String result
	long totalMatches;
	String text
	boolean regex
	Date resultDate

	static constraints = {
		result blank: true, nullable: true
		resultDate defaultValue: "now()"
	}
}
