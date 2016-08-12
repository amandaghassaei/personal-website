void makeProjectsPage(){
  
  String[] pageHTML = new String[genericHead.length];
  arrayCopy(genericHead, pageHTML);
  
  String[] pageBody = new String[genericBody.length];
  arrayCopy(genericBody, pageBody);
  pageHTML = insertArray(pageHTML, "{{body}}", pageBody);
  pageHTML = replaceWord(pageHTML, "{{pageTitle}}","PROJECTS");
  
  String[] menu = loadStrings("html_templates/headerMenuProjectsNoHover.html");
  pageHTML = insertArray(pageHTML, "{{menu}}", menu);
  
  pageHTML = replaceWord(pageHTML, "{{path}}", "/");
  
  String[] projectListItem = loadStrings("html_templates/projectListItem.html");
  String[] projects = new String[0];
  for (TableRow project : projectsTable.rows()) {
    String[] item = new String[projectListItem.length];
    arrayCopy(projectListItem, item);
    
    item = replaceWord(item, "{{projectName}}", project.getString("Project Name"));
    
    if (project.getString("URL").substring(0,4).equals("http")){
      item = replaceWord(item, "{{path}}projects/{{url}}", project.getString("URL") + "\" target=\"_blank");
    } else {
      item = replaceWord(item, "{{url}}", project.getString("URL"));
    }
    item = replaceWord(item, "{{mainWideImg}}", project.getString("Images Wide"));
    item = replaceWord(item, "{{date}}", project.getString("Date"));
    item = replaceWord(item, "{{description}}", project.getString("Short Description"));
    
    projects = concat(projects, item);
  }
  
  pageHTML = insertArray(pageHTML, "{{projectAssets}}", projects);
  
  pageHTML = replaceWord(pageHTML, "{{license}}", "");
  pageHTML = replaceWord(pageHTML, "{{coverImage}}", "");
  pageHTML = replaceWord(pageHTML, "{{path}}", "/");
  saveStrings("mysite/projects/index.html", pageHTML);
}
