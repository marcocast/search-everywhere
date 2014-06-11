package search.everywhere


class SearchableFile {

	String identifier;
	String name;
	String url;
	String path;
	String user;
	String password;

	static constraints = {
		name blank: false, nullable: false
		identifier nullable: true
		url nullable: false, blank: false
		path nullable: false
		password nullable: true
		user nullable: true
	}
}
