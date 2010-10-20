<?PHP

function defaultDisplay() {
  include "functions.inc";
  include "theme.inc";
  $theme->header();

  global $user, $cookie;
  if (isset($user)) getusrinfo($user);

  print "<FORM ACTION=\"submit.php\" METHOD=\"post\">";

  print "<P>\n <B>Your name:</B><BR>";
  if ($user) {
    cookiedecode($user);
    echo " <A HREF=\"account.php\">$cookie[1]</A> &nbsp; &nbsp; <FONT SIZE=\"2\">[ <A HREF=\"account.php?op=logout\">logout</A> ]</FONT>";
  } else {
    echo "$anonymous &nbsp; &nbsp; <FONT SIZE=\"2\">[ <A HREF=\"account.php\">login</A> | <A HREF=\"account.php\">create an account</A> ]</FONT>";
  } 
  ?>

  <P>
   <B>Subject:</B><BR>
   <INPUT TYPE="text" NAME="subject" SIZE="50"><BR>
   <FONT SIZE="2"><I>Bad subjects are 'Check this out!' or 'An article'.  Be descriptive, clear and simple!</I></FONT>
  </P>

  <P><B>Category:</B><BR>
   <SELECT NAME="category">
   <?PHP
    for ($i = 0; $i < sizeof($categories); $i++) {
      echo "<OPTION VALUE=\"$categories[$i]\">$categories[$i]\n";
    }
   ?>
   </SELECT>
  </P>

  <P> 
   <B>Abstract:</B></I><BR>
   <TEXTAREA WRAP="virtual" COLS="50" ROWS="8" NAME="abstract"></TEXTAREA><BR>
   <FONT SIZE="2"><I>HTML is nice and dandy, but double check those URLs and HTML tags!</FONT>
  </P>

  <P> 
   <B>Extended story:</B></I><BR>
   <TEXTAREA WRAP="virtual" COLS="50" ROWS="15" NAME="story"></TEXTAREA><BR>
   <FONT SIZE="2"><I>HTML is nice and dandy, but double check those URLs and HTML tags!</FONT>
  </P>
 
  <P>
   <INPUT TYPE="submit" NAME="op" VALUE="Preview story"> (You must preview at least once before you can submit.)
  </P>

  <P>
   <FONT SIZE="2"><B>Important:</B> remember to include the exact URL of your <U>source</U> in case you refer to a story found on another website or your submission might be rejected!</FONT>
  </P>
 
  </FORM>
  <?PHP
   $theme->footer();
}

function PreviewStory($name, $address, $subject, $abstract, $story, $category) {
  global $user, $cookie;
  include "functions.inc";
  include "theme.inc";
  $theme->header();

  print "<B>Preview:</B><BR>";
  $theme->preview("", $cookie[1], date("l, F d, Y - H:i A", time()), stripslashes($subject), "we-hate-typoes", stripslashes($abstract), "", stripslashes($story));
  print "<FORM ACTION=\"submit.php\" METHOD=\"post\">";

  print "<P>\n <B>Your name:</B><BR>";
  if ($user) {
    cookiedecode($user);
    echo " <A HREF=\"account.php\">$cookie[1]</A> &nbsp; &nbsp; <FONT SIZE=\"2\"> [ <A HREF=\"account.php?op=logout\">logout</A> ]</FONT>";
  } else {
    echo "$anonymous &nbsp; &nbsp; <FONT SIZE=\"2\">[ <A HREF=\"$account.php\">login</A> | <A HREF=\"account.php\">create an account</A> ]</FONT>";
  } 
  ?>

  <P>
   <B>Subject:</B><BR>
   <INPUT TYPE="text" NAME="subject" SIZE="50" VALUE="<? print $subject; ?>"><BR>
   <FONT SIZE="2"><I>Bad subjects are 'Check this out!' or 'An article'.  Be descriptive, clear and simple!</I></FONT>
  </P>

  <P><B>Category:</B><BR>
   <SELECT NAME="category">
   <?PHP
    for ($i = 0; $i < sizeof($categories); $i++) {
      print "<OPTION VALUE=\"$categories[$i]\" ";
      if ($category == $categories[$i]) print "SELECTED";
      print ">$categories[$i]\n";
    }
   ?>
   </SELECT>
  </P>

  <P> 
   <B>Abstract:</B></I><BR>
   <TEXTAREA WRAP="virtual" COLS="50" ROWS="8" NAME="abstract"><? print $abstract; ?></TEXTAREA><BR>
   <FONT SIZE="2"><I>HTML is nice and dandy, but double check those URLs and HTML tags!</FONT>
  </P>

  <P> 
   <B>Extended story:</B></I><BR>
   <TEXTAREA WRAP="virtual" COLS="50" ROWS="15" NAME="story"><? print $story; ?></TEXTAREA><BR>
   <FONT SIZE="2"><I>HTML is nice and dandy, but double check those URLs and HTML tags!</FONT>
  </P>
 
  <P>
   <INPUT TYPE="submit" NAME="op" VALUE="Preview again"> <INPUT TYPE="submit" NAME="op" VALUE="Submit story">
  </P>

  <P>
   <FONT SIZE="2"><B>Important:</B> remember to include the exact URL of your <U>source</U> in case you refer to a story found on another website or your submission might be rejected!</FONT>
  </P>

  </FORM>
  <?PHP
   $theme->footer();
}

function submitStory($name, $address, $subject, $abstract, $article, $category) {
  global $user, $cookie;
  include "functions.inc";

  ### Display confirmation message:
  include "theme.inc";
  $theme->header(); 
  $theme->box("Thanks for your submission.", "Thanks for your submission.  The gnomes in our basement will frown at it, poke at it, and - if you are lucky - even post it!");
  $theme->footer();

  ### Add submission to queue:
  dbconnect();
  if ($user) {
    cookiedecode($user);
    $uid = $cookie[0];
    $name = $cookie[1];
  }
  else {
    $uid = -1;
    $name = $anonymous;
  }
  
  $subject = stripslashes(FixQuotes(check_html($subject, "nohtml")));
  $abstract = stripslashes(FixQuotes(check_html($abstract)));
  $article = stripslashes(FixQuotes(check_html($article)));

  $result = mysql_query("INSERT INTO queue VALUES (NULL, '$uid', '$name', '$subject', '$article', '". time() ."', '$category', '$abstract', 0, 0)");
  
  ### Send notification mail (if required):
  if ($notify) {
    $message = "New submission:\n\nsubject...: $subject\nauthor....: $name\ncategory..: $category\nabstract..:\n$abstract\n\narticle...:\n$article";
    mail($notify_email, "$notify_subject $subject", $message, "From: $notify_from\nX-Mailer: PHP/" . phpversion());
  }
}

switch($op) {
  case "Preview story":
    PreviewStory($name, $address, $subject, $abstract, $story, $category);
    break;
  case "Preview again":
    PreviewStory($name, $address, $subject, $abstract, $story, $category);
    break;
  case "Submit story":
    SubmitStory($name, $address, $subject, $abstract, $story, $category);
    break;
  default:
    defaultDisplay();
    break;
}

?>