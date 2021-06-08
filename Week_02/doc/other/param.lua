request = function()
    path = "https://apigw.91jkys.com/api/invitee_customer_api/1.0/queryReceiveAward?activityId=18&bizId=C_TERMINAL&activityType=1"
    return wrk.format("GET", path)
end