<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  tv.tvdirect.service.connectionJNDI jndi = new tv.tvdirect.service.connectionJNDI();
         
    	  //String query="SELECT current date FROM sysibm.sysdummy1";
/*

select CUSTOMER_TYPE_CODE
,CUSTOMER_TYPE_NAME
from
(SELECT 
'All' as CUSTOMER_TYPE_CODE
,'All' as CUSTOMER_TYPE_NAME
from dual
UNION
SELECT DISTINCT
CUSTOMER_TYPE_CODE
,CUSTOMER_TYPE_NAME
FROM DIM_CUSTOMER
)CUSTOMER_TYPE
ORDER BY CUSTOMER_TYPE_CODE
*/
    	  String  query=" select CUSTOMER_TYPE_CODE,CUSTOMER_TYPE_NAME";
    	  		  query+=" from";
    	  		  query+=" (SELECT ";
    	  		  query+=" 'All' as CUSTOMER_TYPE_CODE,0 as sq";
    	  		  query+=" ,'All' as CUSTOMER_TYPE_NAME";
    	  		  query+=" from dual";
    	  		  query+=" UNION";
    	  		  query+=" SELECT DISTINCT";
    	  		  query+=" CUSTOMER_TYPE_CODE,1 as sq";
    	  		  query+=" ,CUSTOMER_TYPE_NAME";
    	  		  query+=" FROM DIM_CUSTOMER";
    	  		  query+=" )CUSTOMER_TYPE";
    	  		  query+=" ORDER BY sq,CUSTOMER_TYPE_CODE";
		    	 
		    	  //out.print(query);
    	  String columns="1,2";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
  %>
