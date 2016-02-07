
String aboutTxt = "I graduated from Pomona College in Claremont, CA with a BA in Physics and Minor in Chemistry in 2011.  My undergraduate research experience includes topics in nanotechnology, solar cells, and electrochemical and optical sensors.  I'm interested in digital fabrication, materials science, tangible interfaces, and designing software tools that facilitate creative work/play/learning.  I'm currently studying at the <a href='http://cba.mit.edu' target='_blank'>Center for Bits and Atoms</a> at MIT Media Lab.  Before that, I was working at <a href='http://www.instructables.com/member/amandaghassaei/' target='_blank'>instructables.com</a> in San Francisco, CA.<br/> Download my resume <a href='/files/AmandaGhassaeiResume.pdf' target='_blank'>here</a>.";
String aboutEmail = "amandaghassaei<img id='secretImg' src='/images/secretImg.png'><br/>Sorry in advance if I don't get a chance to write you back, grad school is keeping me very busy at the moment.  If you have a question about something specific on instructables, it's best to leave a comment there - otherwise it will get lost in my regular email.  Thanks";

void makeAboutPage()
{
  String[] pageHTML = makeGenericPage();
  pageHTML = replaceWord(pageHTML, "{{pageTitle}}","ABOUT");
  
  String[] aboutMenuHeader = loadStrings("html_templates/headerMenuAbout.html");
  pageHTML = insertArray(pageHTML, "{{menu}}", aboutMenuHeader);
  
  String[] aboutContent = new String[0];
  String[] image = new String[projectImage.length];
  arrayCopy(projectImage, image);
  image = replaceWord(image, "{{imageHeight}}", "416");
  image = replaceWord(image, "{{imageURL}}", "images/etc/gg.gif");
  aboutContent = concat(aboutContent, image);
  
  String[] description = new String[projectDescription.length];
  arrayCopy(projectDescription, description);
  description = replaceWord(description, "{{description}}", aboutTxt);
  description = replaceWord(description, "{{title}}", "");
//  description = replaceWord(description, "{{twoColumn}}", "twoColumn");
  aboutContent = concat(aboutContent, description);
  
  String[] email = new String[projectDescription.length];
  arrayCopy(projectDescription, email);
  email = replaceWord(email, "{{description}}", aboutEmail);
  email = replaceWord(email, "{{title}}", "");
  aboutContent = concat(aboutContent, email);
  
  pageHTML = insertArray(pageHTML, "{{projectAssets}}", aboutContent);
  
  pageHTML = replaceWord(pageHTML, "{{path}}", "/");
  saveStrings("mysite/about/index.html", pageHTML);
}

void makeErrorPage(){
  
  String[] pageHTML = makeGenericPage();
  pageHTML = replaceWord(pageHTML, "{{pageTitle}}","ERROR");
  
  String[] menu = loadStrings("html_templates/headerMenu.html");
  pageHTML = insertArray(pageHTML, "{{menu}}", menu);
  
  String[] errorContent = new String[0];
  String[] image = new String[projectImage.length];
  arrayCopy(projectImage, image);
  image = replaceWord(image, "{{imageHeight}}", "416");
  image = replaceWord(image, "{{imageURL}}", "images/etc/gg.gif");
  errorContent = concat(errorContent, image);
  
  String[] description = new String[projectDescription.length];
  arrayCopy(projectDescription, description);
  description = replaceWord(description, "{{description}}", "there is nothing here.");
  description = replaceWord(description, "{{title}}", "");
  errorContent = concat(errorContent, description);
  
  pageHTML = insertArray(pageHTML, "{{projectAssets}}", errorContent);
  
  pageHTML = replaceWord(pageHTML, "{{path}}", "/");
  saveStrings("mysite/error/index.html", pageHTML);
  
}

String[] makeGenericPage(){
  
  String[] pageHTML = new String[genericHead.length];
  arrayCopy(genericHead, pageHTML);
  
  String[] pageBody = new String[genericBody.length];
  arrayCopy(genericBody, pageBody);
  pageHTML = insertArray(pageHTML, "{{body}}", pageBody);
  
  pageHTML = replaceWord(pageHTML, "{{license}}", "");
  
  return pageHTML;
}
