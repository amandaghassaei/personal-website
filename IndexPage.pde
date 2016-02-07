void makeHomePage()
{          
    String[] pageHTML = new String[genericHead.length];
    arrayCopy(genericHead, pageHTML);
    pageHTML = replaceWord(pageHTML, "{{pageTitle}}", "AMANDA GHASSAEI: HOME");
    
    String[] homeBody = loadStrings("html_templates/homeTemplate.html");
    pageHTML = insertArray(pageHTML, "{{body}}", homeBody);
    pageHTML = insertArray(pageHTML, "{{menu}}", loadStrings("html_templates/headerMenuHome.html"));
    
    String[] fadeInOut = loadStrings("html_templates/fadeInOut.html");
    String[] inlineStyling = loadStrings("html_templates/homeInlineStyling.html");
    pageHTML = insertArray(pageHTML, "<!--extraHead-->", concat(fadeInOut, inlineStyling));
        
    String[] projectListItem = loadStrings("html_templates/projectThumb.html");
    String[] projects = new String[0];
    for (TableRow project : projectsTable.rows()) {
      
      if (projectsTable.getRow(0).getString("Project Name") == project.getString("Project Name")) {
        
          pageHTML = replaceWord(pageHTML, "{{coverImage}}", "coverImage");
          
          pageHTML = replaceWord(pageHTML, "{{coverImagePath}}", project.getString("Cover Image"));
          if (project.getString("Project Name").equals("sugarcube")){
            pageHTML = replaceWord(pageHTML, "{{coverImageExtension}}", "gif");
          } else {
            pageHTML = replaceWord(pageHTML, "{{coverImageExtension}}", "jpg");
          }
          
        pageHTML = replaceWord(pageHTML, "{{projectName}}", project.getString("Project Name").toUpperCase());  
        pageHTML = replaceWord(pageHTML, "{{projectHeader}}", project.getString("Header"));
          
        if (project.getString("URL").substring(0,4).equals("http")){
          pageHTML = replaceWord(pageHTML, "{{path}}{{url}}", project.getString("URL") + "\" target=\"_blank");
        } else {
          pageHTML = replaceWord(pageHTML, "{{url}}", "projects/" + project.getString("URL"));
        }
      
      
        continue;
        
      } else {
      }
      
      String[] item = new String[projectListItem.length];
      arrayCopy(projectListItem, item);
      
      item = replaceWord(item, "{{projectName}}", project.getString("Project Name").toUpperCase());
      
      if (project.getString("URL").substring(0,4).equals("http")){
        item = replaceWord(item, "{{path}}{{url}}", project.getString("URL") + "\" target=\"_blank");
      } else {
        item = replaceWord(item, "{{url}}", "projects/" + project.getString("URL"));
      }
      item = replaceWord(item, "{{projectThumb}}", project.getString("Images"));
      item = replaceWord(item, "{{projectHeader}}", project.getString("Header"));
      
      projects = concat(projects, item);
    }
    
    pageHTML = insertArray(pageHTML, "{{projectThumbs}}", projects);
    pageHTML = replaceWord(pageHTML, "{{path}}", "/");

    saveStrings("mysite/index.html", pageHTML);
}
