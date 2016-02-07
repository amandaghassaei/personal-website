

String[] genericHead, genericBody, projectImage, projectDescription;
Table projectsTable;//

int twoColDescripMin = 700;

void setup() {

  projectsTable = loadTable("Web Database - Projects.tsv", "header, tsv");
    
  genericHead = loadStrings("html_templates/genericHead.html");
  genericBody = loadStrings("html_templates/genericBody.html");
  projectImage = loadStrings("html_templates/projectImage.html");
  projectDescription = loadStrings("html_templates/projectDescription.html");
  
  makeProjectPages();
  makeAboutPage();
  makeErrorPage();
  makeProjectsPage();
  makeHomePage();

  exit();
}

String[] replaceWord(String[] mainArray, String target, String wordToInsert) {
  for (int i=0;i<mainArray.length;i++) {
    mainArray[i] = mainArray[i].replace(target, wordToInsert);
  }
  return mainArray;
}

String[] insertArray(String[] mainArray, String target, String[] arrayToInsert) {
  int spliceIndex = -1;
  for (int i=0;i<mainArray.length;i++) {
    if (mainArray[i].contains(target)) {
      mainArray[i] = mainArray[i].replace(target, "");
      spliceIndex = i;
    }
  }
  mainArray = splice(mainArray, arrayToInsert, spliceIndex);
  return mainArray;
}