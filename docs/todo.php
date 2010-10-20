<H1>Ideas, dreamlog and todo's</H1>
<FONT FACE="courier">

<PRE>

TODO, IDEAS AND FUTURE WORK:
----------------------------

Legend: 
  items tagged with a '!' are considered top-priority and are required to 
  go beta.  Once beta, we need to track down and streamline the engine:
  general tweaking is in order to make things look nice, dandy and in 
  one word professional.

   - Major rewrite of admin.php:
!!    * Enhanced story administration - stories can be updated, though
        not deleted.
!!    * Enhanced user administration  - we certainly need to return to 
        a permission based system!
!  - Fix up the timestamp mess so that it easier to use internally
     + easy to format dates and times according to one's timezone.
!! - The cookies in the poll seems to be broken -> should be stored in
     a user's MySQL record.  (This information can later be used to 
     profile a user.)
!! - We need general parse functions that will be used throughout the
     entire site:
      - checkHTML() to check whether HTML tags are used that are not
        allowed to prevent lamers to mess with HTML code (tables, 
        colors, images, frames, etc.).
      - filterHTML() to track down obvious 'trolling' - certain words
        should not be used, no matter what.  Basic quality filtering
        it is.
   - Group *all* comments off all *news* entries into one big page: 
     this page should work and look like a webboard.  In addition, new 
     threads can be created by users. 
       UPDATE: after some pondering I figured out that this feature
               would be very hard to implement unless we rewrite some 
               major components.
  - search.php:
      * Advanced search (AND, OR)
      * Search comments (a minimum threshold can be specified)
      * Add search function to search google.com, altavista.com,
        slashdot.org, freshmeat.net, ... 
   - Include headlines from other sites - each user can configure
     which 'headline boxes' he or she wants to see displayed.
   - Add XML/RDF-driven backend so other sites could include our
     headlines as well.
   - A hotlist: a feature to add and remove your favorite news to
     your 'hotlist'.  The items in your hotlist will be displayed
     on the right-hand side of the page together with your 
     personal boxes.  A hotlist is handy when you want to follow 
     up on the comments of a specific news entry of interest.
     (See kuro5hin.org for Hotlist example.)
   - History/archive feature a la:
         http://www.drop.org/category/year/month/day/
      The directory structure is not created physically, instead 
      the URI is dynamically parsed and interpretted by the PHP 
      scripts.
      In addition, a better way to browse older articles should
      be incorporated.  search.php just won't do when we have a
      significant database.
   - More flexibility in block placement both for user and admin
     blocks.  Currently, the placement of blocks are 100% theme 
     specific.
     Our first theme system only allowed to theme boxes.  This
     theme section allows to change the position of boxes on a
     theme-by-theme basis.  In a future version, the user should
     be able to adjust the position of boxes.
   - Add 'real' karma support:
       * see slashdot.org moderator faq
       * 'karma masters'
       * 'karma' == 'mojo'
     At the current stage moderation is supported but might not that 
     effective against flamebait and trolls.  Therefor, comment 
     moderation should be enhanced in future.  The required fundaments
     are there though.
   - Account confirmation upon registration.
   - Feature to automatically mail headlines every x days.
!  - Make pending news available to logged on user so they can vote 
     whether the news should be posted or not.  This will be called 
     "news moderation".  
     When someone submits news, it is appended to a queue accessable
     by all registered users.  Every registered user can rate a news
     entry, i.e. can vote whether or not to post the story.  When 
     enough people vote to post a news entry, up it goes on the 
     public main page.  The score or threshold a news entry must 
     reach to be posted will be - for example - a percentage of the
     total number of user accounts.
   - Convert the FAQ to 'real' HTML that actually looks nice and 
     dandy.  *mumble*
   - Increase maintainability by adding more admin sections:
       * FAQ administration through web-interface.
       * Category administration through web-interface. 
       * ...
   - refer.php: keep track of sites that linked to our
     'incorrectly' (not using the '?url=http://www.foobar.com/'
     extension), though exclude them from the link exchange
     program.
   - refer.php: keep track of outgoing links just for sake of
     curiosity.
   - A ChangeLog-script: add, delete and update ChangeLog entries.
     When creating a tarball, we could export the ChangeLog to a
     text file.
   - A Todo-script: add, delete and update Todo entries and Ideas.
   - Use PHP4's session management instead of 100% pure cookie-based
     authentication solution: avoid cookies where possible as they 
     tend to be error-prone.
!! - Art-work: create cool themes, cool slogans, cool graphics 
     (including logos, buttons, banners, ...).  Themed icons for the 
     various categories would be cheezy.
   - Documentation needs to be written:
        * A general FAQ
        * Disclaimer
        * Theme-HOWTO
        * Documentation of the PHP sources: README, INSTALL, etc.
   - Installation script:
        * Automatically create required tables.
   - The final master piece and a step towards a new generation of
     websites is defenitly profiling: keep track of each visitor's
     navigation behavior and to use this information to enhance the
     navigation both globally and for that user in specific.  Every
     single nitwit should be able to customize every single tidbit
     of this page. 
</PRE>
</FONT>
