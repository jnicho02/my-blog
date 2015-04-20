title: JActionCombo
date: 2005/06/06
tags: [code]
author: Jez Nicholson
alias: /jactioncombo

I'm very keen on Swing components being properly object-oriented. An example of this would be a combo box of actions. Many programmers would put the actions into a HashMap, populate the combo with Strings to represent the action, then on actionPerformed look up the action in the HashMap. What I say is: change the comboBox to accept Action objects and render them appropriately...no need to create your own storage...change the representation to something else if you want...

    import java.awt.Component;
    import java.awt.event.ActionEvent;
    import java.awt.event.ActionListener;
    
    import javax.swing.Action;
    import javax.swing.JComboBox;
    import javax.swing.JLabel;
    import javax.swing.JList;
    import javax.swing.ListCellRenderer;
    
    /**
     * A combo box that you can add Actions to.
     * When the action is selected it will be fired.
     */
    public class JActionCombo extends JComboBox
    {    
        public JActionCombo()
        {
            super();
            setRenderer(new ActionRenderer());
            addActionListener(new ComboBoxActioner());
        }
    
        public void addItem(Object action)
        {
            if (!(action instanceof Action))
            {
                throw new RuntimeException("can only accept Actions");
            }
            super.addItem(action);
        }
    
        /**
         * display the name of an action as a label
         */
        private static class ActionRenderer extends JLabel implements ListCellRenderer
        {
            public Component getListCellRendererComponent(
                JList arg0,
                Object value,
                int arg2,
                boolean arg3,
                boolean arg4)
            {
                if (value instanceof Action)
                {
                    Action action = (Action) value;
                    Object nameValue = action.getValue("Name");
                    if (nameValue != null)
                    {
                        String name = nameValue.toString();
                        setText(name);
                    }
                    else
                    {
                        setText(action.toString());
                    }
                }
                return this;
            }
        }
        
        /**
         * for a combo box populated with actions fire the selected action
         * N.B. disable a combobox before programmatically setting the
         * selected value or the event will be fired
         */
        private static class ComboBoxActioner implements ActionListener
        {
            public void actionPerformed(ActionEvent arg0)
            {
                JComboBox source = (JComboBox) arg0.getSource();
                if (source.isEnabled())
                {
                    Object selected = source.getSelectedItem();
                    if (selected instanceof Action)
                    {
                        Action action = (Action) selected;
                        action.actionPerformed(arg0);
                    }
                }
            }
        }
    }