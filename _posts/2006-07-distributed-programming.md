title: distributed programming Web2.0 style
date: 2005/07/19 21:00:00 -0700
tags: [books]
author: Jez Nicholson
alias: /distributed-programming

Whilst poking round the net I found the Web2.0 Validator. It is a slightly irreverant site that applies a set of rules to work out how 'Web2.0y' your site is. The interesting part (to me) is that they've enabled the specification of the rules themselves to be done by the general public via del.icio.us

If you mark the Web2.0 Validator site in del.icio.us you can specify a rule in the notes field using [multiple] regular expressions in the format Some Descriptive Rule Name : /regex1/ /regex2/ ... /regexN/. del.icio.us can then be queried by Web2.0 Validator and attempt to parse the rules...if it parses then it's in. In this way they are achieving a sort of distributed programming model.

In a business context, I suppose this could be used in a data warehousing system to allow managers to specify business metrics....I'm sure there are lots of other practical uses.

( Jul 19 2006, 09:05:21 AM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20060717 Monday July 17, 2006
data wants to be free...but not football fixtures
After the success of my World Cup Google Calendar I have an interest in football fixture data. There is currently a storm-in-a-teacup over this year's UK football fixtures. It seems that the Football Leagues are attempting to control and extract the value out of football information, including the fixture list. Fan sites such as Watford's Blind Stupid and Desperate have been persued for publishing next season's fixture list, to the point of their service provider being forced to block their site. It appears that licences are available to fan's, with a special rate for fanzines.....but only one fanzine per club. So, that's the "official unofficial club magazine" then! You can mention where the game on Saturday will be, but only in an editorial context, but "The provision of a listing of fixtures masquerading as an editorial piece is not acceptable."

So, I won't even be thinking about creating a Google Calender of the Premiership fixtures. I would be breaking copyright. It would have been a bit of a fag anyway. However....information wants to be free, it will take the path of least resistance and dissadent web sites will crop up. We'll see what happens!

This has a relevence to Developers as it is the first (?) example of someone protecting copyright of microcontent that i've seen.

Soccer Leagues and NPA Agreement – Reassessing the Value of Data Rights
BBC Sport Premiership Fixtures
UK Football Rights FAQ
( Jul 17 2006, 11:44:17 AM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20060703 Monday July 03, 2006
declaring log4j loggers statically....or not?
Logging is undeniably extremely useful, but I haven't quite worked out which strategy to use for creating loggers yet.

I've seen: protected final Log log = LogFactory.getLog(getClass()); used in AppFuse, which I assume means that you don't need to override in for subclasses. However, you can't log messages in static methods, as the logger is non-static.

In other systems I have declared a static logger: protected static Log log = LogFactory.getLog(Grid.class); and then overridden it in subclasses uses a static initializer (hurrah! I found a use for static initializers!) static { log = LogFactory.getLog(DateGrid.class); }

I guess that the first way is useful because you don't need to keep stating the class, but unless there's a good reason why (please comment....) then the static version is more helpful...or have I made a mistake somewhere?


Update (20th July 2006)
Thanks for all the comments. I realised that my whole static initialiser malarky was cobblers as of course it would make logging statements from Grid look like they came from DateGrid. I've settled on declaring a log object in each and every class file, but i am using the abstract commons.logging classes and not the specific log4j just to be pedantic

private static final org.apache.commons.logging.Log log = org.apache.commons.logging.LogFactory.getLog($CLASS_NAME$.class);

Which will be transient by definition as it is static.

( Jul 03 2006, 02:50:56 PM BST ) Permalink Comments [6] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20060701 Saturday July 01, 2006
quick cloning in Hibernate
Yesterday, I was pondering why my system was a bit slow in performing a clone operation when I had an epiphany.

The system uses Hibernate with the objects extending a base object and implementing a primary key + version number. I had cunningly written a generic clone method that queries Hibernate metadata and copies the contents across to the new object. This works fine, but there is some reflection and new object instantiation in there, both of which take time. It also seems to take up a lot of memory on the client, but that may be a misnomer.

Part of the clone operation involves not copying the id and version from the original (or setting id to null and version to zero on the new object) so that Hibernate recognises it as a new object. This got me to thinking, why not traverse the object tree of the existing objects setting their ids to null....and then save them in Hibernate, making new records in the database! I might have to watch out for objects that aren't involved in a cascade-update and pre-save them, but it sounds much quicker to only work on the id + version.

There might be some problems if objects are already being referenced by screens or whatever as they will now be the cloned object, but seeing as this is a rare operation when I need to clone an entire project at one time then I can't see any problems. I'll follow up with a note when i've tried it out.

( Jul 01 2006, 02:12:43 PM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20060609 Friday June 09, 2006
Java best practice
I was searching for some Java best practice information on Serializable and came across http://www.javapractices.com/. It's a collection of those rules of thumb that you pick up over the years. I find this very useful as it confirms a number of things that i've thought, and adds to it. Java carries a bit of old baggage around with it so that it's backward compatible and sometimes it is hard to see which is the best method to use. The downside is that when I do my 'wise old developer' act with Doug maybe he'll see through me!

My other favourite is The Java Almanac. I've used the examples many times.

If anyone has any other useful sources like these then please comment...

( Jun 09 2006, 10:02:54 AM BST ) Permalink Comments [2] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20060525 Thursday May 25, 2006
my World Cup calendar gets used in school
I was very pleased to receive an email from murky telling me that my England World Cup Glory Google Calendar

"I teach IT, and today I've been showing the boys calendaring software - yours was used as an example, so you probably have quite a few subscribers!"

I had been playing with Google Calendar and used it as an example. A sign of duplicated effort on the net is that when I set the calendar up there weren't any others available, now there are 181.

If you have Google Calendar and wish to subscribe then:

Under the Calendars list click 'manage calendars'
Under Other Calendars click 'add calendar'
Select Public Calendar Address
Enter http://www.google.com/calendar/ical/bqnoop4s611jmcjcio5rvg92co@group.calendar.google.com/public/basic as the public address
You can add any ical calendar to Google Calendars. I have ones from upcoming.org on mine.

There is an RSS feed which is in 'last edited' order. Not sure how useful that is (?)

( May 25 2006, 09:36:38 AM BST ) Permalink Comments [1] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20060515 Monday May 15, 2006
an easy Hibernate Criteria orderBy
I've been doing a bit of Hibernate recently using the Criteria object. This helps you to write an hql query without you needing to do loads of string processing to add the 'wheres', 'ands', etc.

One place where it was a minor pain was in doing an orderBy. Personally I want to be able to say criteria.addOrder("field1 asc, field2 desc") rather than build it up one item at a time. Maybe someone will point out that I've missed a method in the standard library, if so i'll update this post accordingly.

Here's my helper method to allow simple passing of an orderBy string to a Hibernate Criteria:

  /**
   * a helper method to add an 'order by' statement to a Hibernate Criteria
   * pass in an orderBy field in the format 'field asc,field2 desc'.
   * It will default to ascending so you can pass 'field, field2 desc'
   * @param criteria
   * @param orderBy
   */
  public static void orderBy(Criteria criteria,String orderBy){
    if (null != orderBy && !("".equals(orderBy.trim()))) {
      StringTokenizer st = new StringTokenizer(
          orderBy, ",");
      while (st.hasMoreTokens()) {
        StringTokenizer st2 = new StringTokenizer(st.nextToken());
        int tokenCount = 1;
        String field = null;
        String direction = "asc";
        while (st2.hasMoreTokens()) {
          String token = st2.nextToken();
          switch (tokenCount) {
          case 1:
            field = token;
            break;
          case 2:
            direction = token;
            break;
          default:
            break;
          }
          tokenCount++;
        }
        if (null != field) {
          if ("asc".equalsIgnoreCase(direction)) {
            criteria.addOrder(Order.asc(field));
          } else {
            criteria.addOrder(Order.desc(field));
          }
        }
      }
    }
  }
( May 15 2006, 03:27:26 PM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
geoUrl tagging non-tagged web pages
I have an idea for a small extension to geourl.org. Geourl maintain a database of web pages that are registered as containing an ICBM meta tag (like this blog page does). I've tried to encourage various sites to add the geo meta tags, mainly so that I can play around with GIS stuff such a Google Maps. However, some/many sites don't have the time or inclination to do so. Maybe, rather than relying on site owners to goetag their pages it should be open to web users to do it? A simple solution would be to enable people to add an address plus a geocode to the geourl database and the info come out of the RSS as if it had the tags in the page.

The system could be friendly and offer the site owner information about their site, e.g. an email saying "you could add the following meta tags to page xxx.html..."

Peer review
I've also been thinking about an anti-spam measure where new submissions are sent to people whose geo location is near to the new one. They could then peer review the info and weed out spam.

( May 15 2006, 02:05:56 PM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
Certainty
Certainty is key when running a business. When your customers give you money to do something then they expect you to do it, within a timeframe they feel is reasonable, and with a certain level of hassle. These are the parameters that make up the offering, and the business needs to be certain that they can achieve these targets.

does IT deliver?
I don't believe that IT system developers provide business with enough ability to be certain. I'm not even sure that we know that it's a problem. It's one of those 'managers are from Mars, developers are from Venus' moments. Traditional project management has concentrated heavily on the achievement of milestones, but when the system goes into production the approach is one of service quality measurements (e.g. IT = a system can perform a process, Production: time taken to perform a process). We're asked to develop systems by a certain time, so that's what we do. It's all well and good finishing a system on time, but how certain are you that it works? How much of next year's salary would you be willing to bet on that?

defining 'works'
Ah, what a nightmare, we can't even define how we measure whether a system 'works' or not! Most of the time we get bogged down in arguments over 'bugs'.

I have a perennial argument about what is a bug and what is a new feature. In the end it all comes down to nomenclature, one man's bug is another man's feature. It doesn't matter...a computer system is bought-as-seen, assuming that the developers have done enough to prove to the customer that it does what it is supposed to do, they've coughed up the cash and it's been used in a live situation for a reasonable bedding-in/warranty period, then anything that it doesn't do in the way required is a new 'issue'. In business it is a case of 'is it good enough to perform the required service'.

It's a bit like buying a car. You expect the core functionality (engine, steering, brakes) to be 100% correct, but are prepared to expect different levels of finish depending on the price (walnut dash, nice radio). The one true measure is 'did you part with money for the car, or not'.

So one measure of 'works' for a system sold to an external customer is whether they are prepared to give you the cash. Not sure how this would translate to an internal customer though?

SLA's made a difference, as they are an attempt to define 'works' in service terms, e.g. "a payment must be processed within 3 days of receipt". But SLA's are not always defined and when they are it is sometimes done without full consideration, e.g. "there will be 99.9% uptime".

definition changes over time
Over time, as the system is used in a live situation the definition of 'works' will change. Businesses need to maintain competitive advantage and as soon as a competitor releases a feature or performs an equivalent service better then the parameters change. Previously minor features may suddenly become more important if they are what differentiate your product, and the system may suddenly not 'work'.

how sure are you?
How can you prove to a business person that the system you've built will perform the core functionality accurately and in a timely manner? Business people like metrics. If you don't measure something then you can't change it.

Test coverage report: prove that you've tested everything
Reports from Automated test scripts
Volume testing results
javadoc comment coverage. Not sure how you can test the 'correctness of comments' though
We've learnt from the documentation debacle that writing long documents is a waste of time. Documention must be an artifact of the system.

"Trust me, i'm a pro!"
Another angle for creating confidence is to prove that we are professionals.

Test-driven development leads to higher quality code
Use of a sturdy framework means that more effort is spent on the system that on the framework
Fewer lines of code, fewer things to go wrong?
Track record of the developers. Have they got a history of delivering accurate solutions?
( May 15 2006, 10:00:37 AM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20060505 Friday May 05, 2006
using CSS on html in a JTextPane
Creating an HTML editor with standard jdk1.4/1.5 Swing is fairly simple, but remains slightly buggy and HTML 3.2-based. One nice touch is that a JTextPane can handle CSS.

I do this in two ways. Firstly, to apply CSS directly to a panel:

package core.view.editor;

import javax.swing.JTextPane;
import javax.swing.text.Document;
import javax.swing.text.html.HTMLEditorKit;
import javax.swing.text.html.StyleSheet;

public class Foo extends JTextPane {
  public Foo() {
    super();
    HTMLEditorKit kit = new HTMLEditorKit();
    setEditorKit(kit);
    StyleSheet styleSheet = kit.getStyleSheet();
    styleSheet
        .addRule("body {margin-left:22px; margin-top:22px; margin-right:22px;}");
    styleSheet
        .addRule("body {color:#000000; font-family:Verdana,sans-serif;}");
    Document doc = kit.createDefaultDocument();
    setDocument(doc);
  }

}
and secondly to create Actions and hence buttons or drop-downs to control the display

package core.view.editor;

import java.awt.event.ActionEvent;

import javax.swing.JEditorPane;
import javax.swing.text.html.HTMLEditorKit;
import javax.swing.text.html.StyleSheet;
import javax.swing.text.html.HTMLEditorKit.HTMLTextAction;

/**
 * apply a number of css rules to the stylesheet
 */
public class CssAction extends HTMLTextAction {
  public CssAction(String name, String[] rules) {
    super(name);
    this.rules = rules;
  }

  public CssAction(String name, String rule) {
    super(name);
    rules = new String[1];
    rules[0] = rule;
  }

  public void actionPerformed(ActionEvent ae) {
    JEditorPane editor = getEditor(ae);
    if (editor != null) {
      HTMLEditorKit kit = getHTMLEditorKit(editor);
      StyleSheet styleSheet = kit.getStyleSheet();
      for (int i = 0; i < rules.length; i++) {
        styleSheet.addRule(rules[i]);
        // no need to remove existing rule
      }
      int pos = editor.getCaretPosition();
      String data = editor.getText();
      editor.setText("");
      editor.setText(data);
      editor.setCaretPosition(pos);
    }
  }

  // set of css rules, e.g. "body {margin-left:22px;}"
  private String[] rules;

}
Then I extend HTMLEditorKit to add my Actions to the standard set.

package core.view.editor;

import javax.swing.Action;
import javax.swing.text.TextAction;
import javax.swing.text.html.HTMLEditorKit;

public class MyHTMLEditorKit extends HTMLEditorKit {
  private static final Action[] customDefaultActions = {
      new CssAction("Small", "body {font-size: 10pt;}"),
      new CssAction("Medium", "body {font-size: 14pt;}"),
      new CssAction("Large", "body {font-size: 18pt;}") };

  public Action[] getActions() {
    return TextAction.augmentList(super.getActions(), customDefaultActions);
  }

}
package core.view.editor;

import javax.swing.JTextPane;
import javax.swing.text.Document;
import javax.swing.text.html.HTMLEditorKit;
import javax.swing.text.html.StyleSheet;

public class Foo extends JTextPane {
  public Foo() {
    super();
    HTMLEditorKit kit = new MyHTMLEditorKit();
    setEditorKit(kit);
    Document doc = kit.createDefaultDocument();
    setDocument(doc);
  }

}
Leaving you only to retrieve the Actions from getActions() by name (getValue("Name")) and creating a JButton or JMenuItem or use my previously mentioned JActionComboBox

** Update 7th Oct 2010**
So, this appears to be my most popular blog post and is still visited 4 years after I wrote it. I hope that it is still relevant.

Anyway, I was just looking at The Flying Saucer Project, an open source XML/XHTML/CSS 2.1 Renderer in Java. If you've read down this far then it may be another thing to consider.

( May 05 2006, 10:50:00 AM BST ) Permalink Comments [1] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20060421 Friday April 21, 2006
what is the 'best' way to build a desktop widget?
Latest project requires a desktop widget to automatically update itself and display the number and status of bookings, e.g. some cute pictures of planes that fill up to show bookings for the week, but what is the 'best' way to do this?

First off, what does 'best' mean in this situation? Well it needs to be:

highly graphical and groovy,
easily updatable to new versions,
not a resource hog,
easy to install,
not have too many platform-specific requirements that cause loads of support calls.
...some other stuff I haven't thought of yet...
Yahoo Widgets
My first thought was of Yahoo Widgets (used to be Konfabulator). The Yahoo Weather widget sits on my desktop and looks really beautiful and is just the sort of thing we want to produce.


You can create a widget direct from Photoshop files, so slick graphics are easily possible. It can do GET and POST calls, so can be made more secure than an RSS reader. Dave tells me that the software can be a little bit buggy plus it can be a bit of a resource hog, but i've been running it for a few week now and it hasn't given me any trouble. Maybe Dave was using it a while ago? The things that might put me off are that you need to install and run the Yahoo Widget Engine in the background and this might put some people off. It's a new tech for me so is untested as yet, but that doesn't normally put me off.

Comments from Loosely Coupled about the potential of Yahoo Widgets

Flash/Flex
Second thought was of Flash/Flex. Slick graphics are possible and there are plenty of developers out there, but am not sure whether you could program an always-on desktop widget with it?

OpenLaszlo
Then there's OpenLaszlo, but similar to Flash/Flex

Swing
I could just fall back to my old favourite Java Swing, but that might just be a case of having a hammer and seeing every problem as a nail. But, I do have plenty of experience of it so could cope with any problems that are thrown up. I can't say that any of the GUIs i've worked on have been works of art, but I know that groovy interfaces are possible.

Help!
What to do....maybe someone can suggest other technologies or give some advice?....or maybe not, 155 reads so far and zero comments...

( Apr 21 2006, 10:36:12 AM BST ) Permalink Comments [1] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20060420 Thursday April 20, 2006
playing with Google Calendar
So, i've been having a good play with Google Calendar. Frankly i'm amazed that there hasn't been a mainstream calendaring system around for years. It doesn't seem to be rocket science that you should be able to produce and consume streams of data in ical format, but maybe there was more to it than that!

Anyway, Google Calendar is a good example of a web 2.0 app using ajax and being developed in an Agile manner.

I've produced one public feed: England World Cup Glory (I think that you can see where i'm coming from...) with the dates of the soccer World Cup starting in June and some predictions of who is going to win various games.

If you've got Calendar then you can subscribe by: manage calendars....under 'other calendars' --> add calendar....public calendar tab....and paste in http://www.google.com/calendar/ical/bqnoop4s611jmcjcio5rvg92co@group.calendar.google.com/public/basic this  ical feed works in netvibes too as they have amended how their software processes ical feeds.

The rss feed is http://www.google.com/calendar/feeds/bqnoop4s611jmcjcio5rvg92co@group.calendar.google.com/public/basic it seems to work in Sage/Firefox but not in other readers. I don't like the fact that it is in date changed ordered rather than in event date order but hey, maybe that's what an RSS feed should show? Plus I can't see how to change the event statuses yet.

( Apr 20 2006, 04:43:59 PM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20060413 Thursday April 13, 2006
notes from watching Paul Browne talking about Agile
Just been prompted by the Slingshot AF development blog to watch a video of Paul Browne talking about Agile and how to sell it to your manager.

I'm always looking for ways to improve our development process and Paul makes some interesting comments. Some that I noted were:

It's generally accepted that coding for re-use is 'good'. If you practice test-first development (I prefer 'test-during') then your JUnit tests are effectively the first case where your code is being re-used. The re-usability of the code will be affected as you are programming it to be test-friendly.
Tools that I haven't tried yet are NUnit, NoUnit and XPlanner
Project Managers will like Agile because of the metrics, e.g. you can show that 50% of the issues to achieve a story are complete.
Negotiation skills are important when deciding with the client which issues will be included in which release
Clients often only really want to know when the system is finished, but Agile involves them in the process. They will like the fact that they can always access a working version and see it growing, but they may need to be educated over time on being involved in the process. If requirements are allowed to change over time then the client will need to accept the balance in cost, time or other features lost.
Sales skills would be very useful for a 'techie'. People buy through fear or greed, identify the fear and you can convince someone to buy. E.g. to 'sell' Agile to a Project Manager tell them that they can deliver with fewer bugs and on time.
( Apr 13 2006, 04:00:53 PM BST ) Permalink Comments [0] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20060412 Wednesday April 12, 2006
Agile testing: numbers to words
JUnit testing before/during coding can drastically improve the quality of your code. I've been coding a small util to convert numbers into words. First step was a quick google which soon threw up Réal Gagnon's EnglishDecimalFormat

Being an Agile-type Developer I wasn't happy that the tests were being done in main() as System.outs so I knocked up a test class. It produced results immediately, as Réal hadn't included the word 'and' in his output, as in the famous darts cry of, "one hundred and eighty!!!". As I added further (random) test cases I noticed a third variation with two 'and's 120001 = 'one hundred and twenty thousand and one'.

I know that this all sounds a bit sad, but there is a point:

a JUnit test that took 5 minutes to code paid off almost immediately by showing up potential errors.
the process of adding test cases makes you think about the problem more. Only by adding test cases did I think of 120001. That's why testing before or during coding will change the way you code....it makes you think about the problem and express the various outcomes.
random test cases are not enough. Coverage is vital. I should identify the potential combinations and have a test for each.
import junit.framework.TestCase;

/**
 * tests the EnglishDecimalFormat
 */
public class EnglishDecimalFormatTest extends TestCase {

    public static void main(String[] args) {
        junit.swingui.TestRunner.run(EnglishDecimalFormatTest.class);
    }

    protected void setUp() throws Exception {
        super.setUp();
    }

    protected void tearDown() throws Exception {
        super.tearDown();
    }

    public final void testZero() {
      assertEquals("zero",EnglishDecimalFormat.convert(0));
    }

    public final void testOne() {
      assertEquals("one",EnglishDecimalFormat.convert(1));
    }

    public final void testTwo() {
      assertEquals("two",EnglishDecimalFormat.convert(2));
    }

    public final void testThree() {
      assertEquals("three",EnglishDecimalFormat.convert(3));
    }

    public final void testSixteen() {
      assertEquals("sixteen",EnglishDecimalFormat.convert(16));
    }

    public final void testTwentyNine() {
      assertEquals("twenty nine",EnglishDecimalFormat.convert(29));
    }

    public final void testOneHundred() {
      assertEquals("one hundred",EnglishDecimalFormat.convert(100));
    }

    public final void testOneHundredAndOne() {
      assertEquals("one hundred and one",EnglishDecimalFormat.convert(101));
    }

    public final void testOneHundredAndEighteen() {
      assertEquals("one hundred and eighteen",EnglishDecimalFormat.convert(118));
    }

    public final void testOneHundredAndTwenty() {
      assertEquals("one hundred and twenty",EnglishDecimalFormat.convert(120));
    }

    public final void testTwoHundred() {
      assertEquals("two hundred",EnglishDecimalFormat.convert(200));
    }

    public final void testTwoHundredAndOne() {
      assertEquals("two hundred and one",EnglishDecimalFormat.convert(201));
    }

    public final void testOneThousandThreeHundredAndSixteen() {
      assertEquals("one thousand three hundred and sixteen",EnglishDecimalFormat.convert(1316));
    }

    public final void testOneHundredThousand() {
      assertEquals("one hundred thousand",EnglishDecimalFormat.convert(100000));
    }

    public final void testOneHundredAndTwentyThousand() {
      assertEquals("one hundred and twenty thousand",EnglishDecimalFormat.convert(120000));
    }

    public final void testOneHundredAndTwentyThousandAndOne() {
      assertEquals("one hundred and twenty thousand and one",EnglishDecimalFormat.convert(120001));
    }

    public final void testOneMillion() {
      assertEquals("one million",EnglishDecimalFormat.convert(1000000));
    }

    public final void testThreeMillionTwoHundred() {
      assertEquals("three million two hundred",EnglishDecimalFormat.convert(3000200));
    }

    public final void testMinusFortyFive() {
      assertEquals("minus forty five",EnglishDecimalFormat.convert(-45));
    }

    public final void testOneHundredTwentyThreeMillionFourHundredFiftySixThousandSevenHundredAndEightyNine() {
      assertEquals("one hundred twenty three million four hundred fifty six thousand seven hundred and eighty nine",EnglishDecimalFormat.convert(123456789));
    }
}
( Apr 12 2006, 10:04:41 AM BST ) Permalink Comments [3] 

 BlinkList  del.icio.us  digg  Fark  Furl  Newsvine  reddit  Simpy  Spurl  Yahoo! MyWeb
20060411 Tuesday April 11, 2006
How to see whether your job advert sucks
Trying to employ a new Developer? Writing a job advert? Posting on http://discuss.joelonsoftware.com/?jobs will get some pretty frank feedback...of course you could just read some of the past postings and glean the right and wrong way to advertise for Developers. Writing an advert should really be handled by an HR professional, but not everyone has one available. The biggest complaints seem to be that employers don't put a salary range, or forget to put the location.