void makeProjectPages()
{
  Table imagesTable = loadTable("Web Database - Project Images.tsv", "header, tsv");

  String[] projectIframe = loadStrings("html_templates/projectIframe.html");
  String[] projectTitle = loadStrings("html_templates/projectTitle.html");
  String[] license = loadStrings("html_templates/license.html");
  
  String[] projectsMenuHeader = loadStrings("html_templates/headerMenuProjects.html");

  for (TableRow project : projectsTable.rows()) {
        
    if (project.getString("Make Page").equals("FALSE")) continue;
    String[] pageHTML = new String[genericHead.length];
    arrayCopy(genericHead, pageHTML);
    String projectName = project.getString("Project Name");
    String url = project.getString("URL");
    pageHTML = replaceWord(pageHTML, "{{pageTitle}}", projectName.toUpperCase());
    pageHTML = replaceWord(pageHTML, "{{path}}", "/");
    
    
    String[] pageBody = new String[genericBody.length];
    arrayCopy(genericBody, pageBody);
    pageHTML = insertArray(pageHTML, "{{body}}", pageBody);
    pageHTML = insertArray(pageHTML, "{{menu}}", projectsMenuHeader);

    String[] projectList = new String[0];
    boolean firstImage = true;
    for (TableRow image : imagesTable.rows()) {
      if (image.getString("Project Name").equals(url)) {
        //add image in list
        String[] thisImage = new String[projectImage.length];
        if (!image.getString("iframe").equals("")) {
          arrayCopy(projectIframe, thisImage);
          thisImage = replaceWord(thisImage, "{{iframe}}", image.getString("iframe"));
        } 
        else {
          arrayCopy(projectImage, thisImage);
          thisImage = replaceWord(thisImage, "{{imageHeight}}", image.getString("Height"));
          thisImage = replaceWord(thisImage, "{{imageURL}}", image.getString("URL"));
        }
        
        if (firstImage && !project.getString("Cover Image").equals("")){
          pageHTML = replaceWord(pageHTML, "{{coverImage}}", "coverImage");
          String[] coverImage = loadStrings("html_templates/coverImage.html");
          pageHTML = insertArray(pageHTML, "<!--coverImageDiv-->", coverImage);
          
          String[] inlineStyling = loadStrings("html_templates/projectsInlineStyling.html");
          pageHTML = insertArray(pageHTML, "<!--extraHead-->", inlineStyling);
          
          pageHTML = replaceWord(pageHTML, "{{coverImagePath}}", "../"+project.getString("Cover Image"));
          if (projectName.equals("sugarcube")){
            pageHTML = replaceWord(pageHTML, "{{coverImageExtension}}", "gif");
          } else {
            pageHTML = replaceWord(pageHTML, "{{coverImageExtension}}", "jpg");
          }
        }
                
        if (firstImage) {//add main title and description
          
          if (project.getString("Cover Image").equals("")){
            projectList = concat(projectList, thisImage);
            pageHTML = replaceWord(pageHTML, "{{coverImage}}", "");
          }
          
          String[] title = new String[projectTitle.length];
          arrayCopy(projectTitle, title);
          title = replaceWord(title, "{{title}}", projectName);
          title = replaceWord(title, "{{date}}", project.getString("Date"));
          
          String[] description = new String[projectDescription.length];
          arrayCopy(projectDescription, description);
          description = replaceWord(description, "{{description}}", project.getString("Description"));
          //decide whether to do two cols or not
          if (project.getString("Description").length()>twoColDescripMin && !image.getString("Project Name").equals("teaching")){
            description = replaceWord(description, "{{twoColumn}}", "twoColumn");
          } else {
            description = replaceWord(description, "{{twoColumn}}", "");
          }
          
          description = insertArray(description, "{{title}}", title);
          projectList = concat(projectList, description);
          firstImage = false;
          
          if (!project.getString("Cover Image").equals("")){
            projectList = concat(projectList, thisImage);
          }
          
        } else {
          projectList = concat(projectList, thisImage);
        }
        if (!image.getString("Description").equals("")){//include description if necessary
          String[] description = new String[projectDescription.length];
          arrayCopy(projectDescription, description);
          description = replaceWord(description, "{{description}}", image.getString("Description"));
          description = replaceWord(description, "{{title}}", "");
          if (image.getString("Description").length()>twoColDescripMin){
            description = replaceWord(description, "{{twoColumn}}", "twoColumn");
          } else {
            description = replaceWord(description, "{{twoColumn}}", "");
          }
          projectList = concat(projectList, description);
        }
      } 
      else if (!firstImage) {
        break;
      }
    }
    
    pageHTML = insertArray(pageHTML, "{{projectAssets}}", projectList);
    pageHTML = insertArray(pageHTML, "{{license}}", license);
    pageHTML = replaceWord(pageHTML, "{{path}}", "/");
      
//    createOutput("mysite/projects/" + url);
    saveStrings("mysite/projects/" + url + "/index.html", pageHTML);
  }
}