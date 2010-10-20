<HTML>
 <HEAD>
  <TITLE><? include "config.inc"; echo $sitename; ?></TITLE>
  <META NAME="description" CONTENT="drop.org">
  <META NAME="keywords" CONTENT="drop, weblog, portal, community, news, article, announcements, stories, story, computer, science, space, hype, cult, geek, nerd, foo, bar">
 </HEAD>
 <STYLE type="text/css"> 
   <!--
    BODY,TD,P,UL,LI,DIV,FORM,EM,BLOCKQUOTE { font-size: 8pt; font-family: verdana,helvetica,arial; }
   -->
 </STYLE>
 <BODY TEXT="#000000" BGCOLOR="pink" ALINK="#CCFFCC" LINK="#FF0044" VLINK="#6699FF">
 <TABLE BORDER="0" CELLPADDING="2" CELLSPACING="2">
  <TR>
   <TD COLSPAN="3"><IMG SRC="images/logo.gif" ALT="drop.org logo"></TD>
  </TR>
  <TR><TD ALIGN="right" COLSPAN="3"><FONT SIZE="2"><A HREF="">home</A> | <A HREF="/faq.php">faq</A> | <A HREF="/search.php">search</A> | <A HREF="/submit.php">submit news</A> | <A HREF="/account.php">user account</A> | <A HREF="/webboard.php">webboard</A></FONT><HR SIZE=1 NOSHADE></TD></TR>
  <TR>
   <TD VALIGN="top" WIDTH="120">
    <?
      dbconnect();

      ### Display admin blocks:
      displayAdminblock();

      ### Display referring sites:
      displayReferrals();
    ?>
   <TD VALIGN="top" WIDTH="440">
