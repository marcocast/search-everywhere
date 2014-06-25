package search.everywhere

class Result {

	@Override
	public String toString() {
		return "Result [identifier=" + identifier + ", resultDate=" + resultDate + "]";
	}
	String identifier;
	String result
	long totalMatches;
	String text
	boolean regex
	long resultDate
	static hasMany = [searchableFileNames:String]

	static constraints = {
		result blank: true, nullable: true
		resultDate defaultValue: "now()"
	}
}
