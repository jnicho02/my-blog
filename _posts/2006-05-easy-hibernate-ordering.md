title: an easy Hibernate Criteria orderBy
date: 2006/05/15
tags: [ideas]
author: Jez Nicholson
alias: /easy-hibernnate-ordering

I've been doing a bit of Hibernate recently using the Criteria object. This helps you to write an hql query without you needing to do loads of string processing to add the 'wheres', 'ands', etc.

One place where it was a minor pain was in doing an orderBy. Personally I want to be able to say criteria.addOrder("field1 asc, field2 desc") rather than build it up one item at a time. Maybe someone will point out that I've missed a method in the standard library, if so i'll update this post accordingly.

Here's my helper method to allow simple passing of an orderBy string to a Hibernate Criteria:
'''java

    /**
     * a helper method to add an 'order by' statement to a Hibernate Criteria
     * pass in an orderBy field in the format 'field asc,field2 desc'.
     * It will default to ascending so you can pass 'field, field2 desc'
     * @param criteria
     * @param orderBy
     */
    public static void orderBy(Criteria criteria,String orderBy)
    {
      if (null != orderBy && !("".equals(orderBy.trim())))
      {
        StringTokenizer st = new StringTokenizer(
            orderBy, ",");
        while (st.hasMoreTokens())
        {
          StringTokenizer st2 = new StringTokenizer(st.nextToken());
          int tokenCount = 1;
          String field = null;
          String direction = "asc";
          while (st2.hasMoreTokens())
          {
            String token = st2.nextToken();
            switch (tokenCount)
            {
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
          if (null != field)
          {
            if ("asc".equalsIgnoreCase(direction))
            {
              criteria.addOrder(Order.asc(field));
            }
            else
            {
              criteria.addOrder(Order.desc(field));
            }
          }
        }
      }
    }
'''