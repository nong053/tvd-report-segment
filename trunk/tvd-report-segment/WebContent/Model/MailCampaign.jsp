<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  tv.tvdirect.service.connectionJNDI jndi = new tv.tvdirect.service.connectionJNDI();
  
         
    	  //String query="SELECT current date FROM sysibm.sysdummy1";
/*
MailCampaign

select MAIL_CAMPAIGN_KEY
,CAMPAIGN_NAME
from
(SELECT 
-1 as MAIL_CAMPAIGN_KEY
,'All' as CAMPAIGN_NAME
from dual
UNION
select mailcam.MAIL_CAMPAIGN_KEY
, mailcam.MAIL_CAMPAIGN_CODE||' - '||mailcam.MAIL_CAMPAIGN_NAME as CAMPAIGN_NAME
from DIM_MAIL_CAMPAIGN mailcam
inner join (
								select mailpro.MAIL_CAMPAIGN_KEY
								from FACT_MAIL_PROGRAM mailpro
								inner join DIM_DATE dd on DD.DATE_KEY = mailpro.PROGRAM_CREATED_DATE_KEY
								where (DD.CALENDAR_DATE BETWEEN to_date(${MailCampaignCerateDateStartParam},'yyyy-MM-dd') and to_date(${MailCampaignCerateDateEndParam},'yyyy-MM-dd'))
								GROUP BY mailpro.MAIL_CAMPAIGN_KEY
) mailprogram on mailprogram.MAIL_CAMPAIGN_KEY = mailcam.MAIL_CAMPAIGN_KEY
order by CAMPAIGN_NAME
)MAIL_CAMPAIGN
order by CAMPAIGN_NAME

*/
String MailCampaignCerateDateStartParam = request.getParameter("MailCampaignCerateDateStartParam");
//MailCampaignCerateDateStartParam="All";
String MailCampaignCerateDateEndParam = request.getParameter("MailCampaignCerateDateEndParam");
//MailCampaignCerateDateEndParam="All";

    	  String  query=" select MAIL_CAMPAIGN_KEY";
    	  		  query+=" ,CAMPAIGN_NAME";
    	  		  query+=" from";
    	  		  query+=" (SELECT ";
    	  		  query+=" -1 as MAIL_CAMPAIGN_KEY ,0 as sq";
    	  		  query+=" ,'All' as CAMPAIGN_NAME";
    	  		  query+=" from dual";
    	  	  query+=" UNION";
  	  		  query+=" SELECT"; 
  	  		  query+=" -2 as MAIL_CAMPAIGN_KEY, 1 as sq";
  	  		  query+=" ,'Y' as CAMPAIGN_NAME";
  	  		  query+=" from dual";
  	  		  query+=" UNION";
  	  		  query+=" SELECT ";
  	  		  query+=" -3 as MAIL_CAMPAIGN_KEY, 2 as sq";
  	  		  query+=",'N' as CAMPAIGN_NAME";
  	  		  query+=" from dual";
  	  		  
    	  		  query+=" UNION";
    	  		  query+=" select mailcam.MAIL_CAMPAIGN_KEY ,3 as sq";
    	  		  query+=" , mailcam.MAIL_CAMPAIGN_CODE||' - '||mailcam.MAIL_CAMPAIGN_NAME as CAMPAIGN_NAME";
    	  		  query+=" from DIM_MAIL_CAMPAIGN mailcam";
    	  		  query+=" inner join (";
	    	  	  query+=" 								select mailpro.MAIL_CAMPAIGN_KEY";
	    	  	  query+=" 								from FACT_MAIL_PROGRAM mailpro";
	    	  	  query+=" 								inner join DIM_DATE dd on DD.DATE_KEY = mailpro.PROGRAM_CREATED_DATE_KEY";
	    	  	  //query+=" 								where (DD.CALENDAR_DATE BETWEEN to_date('"+MailCampaignCerateDateStartParam+"','yyyy-MM-dd') and to_date('"+MailCampaignCerateDateEndParam+"','yyyy-MM-dd'))";
	    	  	  
	    	  	if(MailCampaignCerateDateStartParam.equals("All") || MailCampaignCerateDateEndParam.equals("All")){
    	  			
    	  		}else{
    	  		  query+=" 			where (DD.CALENDAR_DATE between to_date('"+MailCampaignCerateDateStartParam+"','yyyy-MM-dd') and to_date('"+MailCampaignCerateDateEndParam+"','yyyy-MM-dd'))"; 
    	  		}  
	    	  	  query+=" 								GROUP BY mailpro.MAIL_CAMPAIGN_KEY";
	    	  	  query+=" ) mailprogram on mailprogram.MAIL_CAMPAIGN_KEY = mailcam.MAIL_CAMPAIGN_KEY";
	    	  	  query+=" order by CAMPAIGN_NAME";
	    	  	  query+=" )MAIL_CAMPAIGN";
	    	  	  query+=" order by sq,CAMPAIGN_NAME";

		    	 
		    	  //out.print(query);
    	  String columns="1,2";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
  %>
