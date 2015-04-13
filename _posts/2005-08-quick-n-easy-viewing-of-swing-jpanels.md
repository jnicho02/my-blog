title: Quick n easy viewing of Swing JPanels
date: 2005/08/17 21:00:00 -0700
tags: [code]
author: Jez Nicholson
alias: /quick-n-easy-viewing-of-swing-jpanels

Now, if you're like me, you still like to code Swing panels by hand. Personally I believe that you can keep the code much tighter than a gui design program and also I don't like getting tied in to a product. When i'm coding Swing panels I generally make them bean-like, giving them a single null constructor. When you are making small cosmetic changes it's very tempting to add a main() to each panel so that you can run it standalone, i.e. you don't want to fire up the whole system. But, that is introducing code that the class is not responsible for, and test code starts to creep in to your nice neat classes. My quick n' easy answer was to write a little program that hunts a given source code directory for classes that extend JComponent and have a null constructor, then make them launchable standalone in a frame.

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.File;

import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.JScrollPane;

/**
 * Offers a list of all JComponents which have null constructors and allows 
 * you to launch one for checking
 */
public class PanelDisplayer
{
   public PanelDisplayer()
   {
      JFrame frame = new JFrame();
      frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
      frame.setTitle("Panel Displayer");
        
        final JList list = new JList();
        panelModel = new DefaultListModel();
        list.setModel(panelModel);
        
        JButton launch = new JButton("Launch");
        launch.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e)
            {
                Object sel = list.getSelectedValue();
                Class clazz = (Class)sel;
                try
                {
                    // assuming it has a null constructor...
                    Object instance = clazz.newInstance();
                    if (instance instanceof JComponent)
                    {
                        display((JComponent)instance);
                    }
                } catch (InstantiationException e1)
                {
                    e1.printStackTrace();
                } catch (IllegalAccessException e1)
                {
                    e1.printStackTrace();
                }
            }});
        frame.getContentPane().add(new JScrollPane(list));
        frame.getContentPane().add(launch,BorderLayout.SOUTH);

        java.awt.Dimension frameSize = new java.awt.Dimension(800, 350);
        java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit()
            .getScreenSize();
        frame.setSize(frameSize);
        frame.setLocation(
            (int) (screenSize.getWidth() - frameSize.getWidth()) / 2,
            (int) (screenSize.getHeight() - frameSize.getHeight()) / 2);
        frame.setVisible(true);
        frame.pack();
	}

	public void  populateModel(String root, String pack)
	{
        String packPath = root+pack.replace('.','/');
        
        File dir = new File(packPath);
        File[] files = dir.listFiles();
        
        if (null!=files)
        {
        for (int i=0;i<:files.length;i++)
        {
            File file = files[i];
            String name = file.getName();
            if (file.isFile() && file.getName().endsWith(".java"))
            {
                String classname = pack +"."+name.substring(0,name.lastIndexOf("."));
                try
                {
                    Class clazz = Class.forName(classname);

                    if (JComponent.class.isAssignableFrom(clazz))
                    {
                        try
                        {
                            clazz.getConstructor(null);
                            panelModel.addElement(clazz);
                        } catch (SecurityException e)
                        {
                        } catch (NoSuchMethodException e)
                        {
                        }
                    }
                } catch (ClassNotFoundException e1)
                {
                    e1.printStackTrace();
                }
            }
            if (file.isDirectory())
            {
                populateModel(root,pack+"."+name);
            }
        }
        }
    }


    /**
     * display chosen panel
     * 
     * @param panel
     */

    public static void display(final JComponent panel)
    {
        JFrame frame = new JFrame();
        frame.setTitle(panel.getName());
        frame.getContentPane().add(panel);

        java.awt.Dimension frameSize = new java.awt.Dimension(800, 350);
        java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit()
            .getScreenSize();
        frame.setSize(frameSize);
        frame.setLocation(
            (int) (screenSize.getWidth() - frameSize.getWidth()) / 2,
            (int) (screenSize.getHeight() - frameSize.getHeight()) / 2);
        frame.setVisible(true);
        frame.pack();
    }

    private DefaultListModel panelModel;
    
    public static void main(String[] args)
    {
        PanelDisplayer pd = new PanelDisplayer();
        pd.populateModel("y:/accelerator/Java/","core.view");
    }

}
    
I initially thought that it would be easy enough to ask the ClassLoader about what classes there were, but had a few problems. I ended up scanning the file directory. Maybe someone will show me the error of my ways! Anyway, it is not really polished code I just thought that someone might find it useful.