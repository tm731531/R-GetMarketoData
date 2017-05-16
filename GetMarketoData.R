###MARKETO###

library(httr)
library(rjson)
root<-"ROOT網址"
clientId<-"clientId"
clientSecret<-"clientSecret"
MKTOstr<-paste0(root,"identity/oauth/token?grant_type=client_credentials&client_id=",clientId
                ,"&client_secret=",clientSecret)
json<-content(GET(MKTOstr), "text")
marketoToken<-fromJSON(json)$access_token

##Usage
Usagestr<-paste0(root,"rest/v1/stats/usage.json?access_token=",marketoToken)

jsonUsage<-content(GET(Usagestr), "text")

jsonUsageData<-fromJSON(jsonUsage)

jsonUsageDataFrame<-as.data.frame(jsonUsageData)


##Usage7days
Usagestr7<-paste0(root,"rest/v1/stats/last7days.json?access_token=",marketoToken)

jsonUsage7<-content(GET(Usagestr7), "text")

jsonUsageData7<-fromJSON(jsonUsage7)

jsonUsageDataFrame7<-as.data.frame(jsonUsageData7)

##PageToken
PageToken<-paste0(root,"rest/v1/activities/pagingtoken.json?access_token=",marketoToken
                       ,"&sinceDatetime=2015-07-20T00:00:00-00:00")

jsonPageToken<-content(GET(PageToken), "text")

jsonPageTokenData<-fromJSON(jsonPageToken)$nextPageToken




##activitiesType
activitiesType<-paste0(root,"rest/v1/activities/types.json?access_token=",marketoToken)

jsonactivitiesType<-content(GET(activitiesType), "text")

jsonactivitiesTypeData<-fromJSON(jsonactivitiesType)

jsonactivitiesTypeDataFrame<-as.data.frame(jsonactivitiesTypeData)



##activities
activities<-paste0(root,"rest/v1/activities.json?access_token=",marketoToken
                   ,'&activityTypeIds=13&nextPageToken=',jsonPageTokenData)

jsonactivities<-content(GET(activities), "text")

jsonactivitiesData<-fromJSON(jsonactivities)
#(jsonactivitiesData)$result
jsonactivitiesmatrix<-as.matrix((jsonactivitiesData$result))
jsonactivitiesDataFrame<-as.data.frame(jsonactivitiesmatrix)
MicroStr<-"https://esupport.trendmicro.com/en-⋯⋯"
for(i in c(1:30000)){
  print(i)
  claw<-GET(MicroStr)
}


