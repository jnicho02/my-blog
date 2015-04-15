title: using CSS on html in a JTextPane
date: 2006/05/05 21:00:00 -0700
tags: [code]
author: Jez Nicholson
alias: /using-css-in-a-jtextpane

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