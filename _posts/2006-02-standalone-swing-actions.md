title: standalone Swing Actions
date: 2006/02/09 21:00:00 -0700
tags: [Java,code]
author: Jez Nicholson
alias: /standalone-swing-actions

I saw the SwingUtilities.getRoot(component) in a Java Almanac example Getting the JFrame of a Component and decided to make some of my Swing Actions work standalone so that they are reusable.

However, the example doesn't really have the desired effect because my actions are added to JMenus which then come to life as JPopupMenus which don't have a root pane. By asking the JPopupMenu for it's invoker I was able to get the ultimate parent Window.

For example, here's my look and feel changer....

import java.awt.Component;
import java.awt.event.ActionEvent;

import javax.swing.AbstractAction;
import javax.swing.ButtonGroup;
import javax.swing.JCheckBoxMenuItem;
import javax.swing.JMenu;
import javax.swing.JPopupMenu;
import javax.swing.LookAndFeel;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

public class ChangeLookAndFeel extends AbstractAction {
        public ChangeLookAndFeel(UIManager.LookAndFeelInfo laf) {
                super(laf.getName());
                this.laf = laf;
        }

        public void actionPerformed(ActionEvent evt) {
                Component c = (Component) evt.getSource();
                while (null != c.getParent()) {
                        c = c.getParent();
                        if (c instanceof JPopupMenu) {
                                JPopupMenu popup = (JPopupMenu) c;
                                c = popup.getInvoker();
                        }
                }
                try {
                        UIManager.setLookAndFeel(laf.getClassName());
                        SwingUtilities.updateComponentTreeUI(c);
                } catch (IllegalAccessException e) {
                        // problem with laf, we don't care.
                } catch (UnsupportedLookAndFeelException e) {
                        // problem with laf, we don't care.
                } catch (InstantiationException e) {
                        // problem with laf, we don't care.
                } catch (ClassNotFoundException e) {
                        // problem with laf, we don't care.
                }
        }

        public static JMenu createMenu() {
                JMenu lafMenu = new JMenu("Look and feel");
                ButtonGroup group = new ButtonGroup();
                UIManager.LookAndFeelInfo[] laf = UIManager.getInstalledLookAndFeels();
                LookAndFeel current = UIManager.getLookAndFeel();

                for (int i = 0; i < laf.length; i++) {
                        JCheckBoxMenuItem menuItem = new JCheckBoxMenuItem(
                                new ChangeLookAndFeel(laf[i]));
                        if (laf[i].getName().equals(current.getName())) {
                                menuItem.setSelected(true);
                        }
                        group.add(menuItem);
                        lafMenu.add(menuItem);
                }
                return lafMenu;
        }

        private UIManager.LookAndFeelInfo laf;

}