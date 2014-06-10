package search.everywhere


class SearchableFile {

	String name;
	String url;
	String path;
	String user;
	String password;

	static constraints = {
		name blank: false, nullable: false
		url nullable: false, blank: false
		path nullable: false
		password nullable: true
		user nullable: true
	}
}
