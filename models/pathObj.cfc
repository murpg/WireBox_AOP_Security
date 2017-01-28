/**
* I get the path and allow you to dynamically set the path
*/
component singleton{
	
	pathObj function init(){
		
		return this;
	}
	
	public function getPath(string removeFolders="models\", string addFolders="includes\images") {
		
			var rootDir = "";
			rootDir = getDirectoryFromPath(getCurrentTemplatePath());
			rootDir = replaceNOCase(rootDir, arguments.removeFolders, arguments.addfolders);
			
			return rootDir;
		
	}
	
}
