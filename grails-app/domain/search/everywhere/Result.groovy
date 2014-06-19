package search.everywhere

class Result {

	String identifier;
	String result
	long totalMatches;
	String text
	boolean regex
	Date resultDate
	static hasMany = [searchableFileNames:String]

	static constraints = {
		result blank: true, nullable: true
		resultDate defaultValue: "now()"
	}
}
