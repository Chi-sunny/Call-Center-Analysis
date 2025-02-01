select * from [Call Center]

SELECT COUNT(*) AS rows_num FROM [Call Center]
SELECT COUNT(*) AS col_num FROM [Call Center]

  UPDATE[Call Center];
SELECT CONVERT(VARCHAR, call_timestamp, 103) AS formatted_date
FROM [Call Center];

--the duration of calls from centers with the longest interation period
SELECT [call_duration_in_minutes], COUNT(*) AS duration
FROM [Call Center]
GROUP BY [call_duration_in_minutes];

-- How many calls fall within the defined Service Level Agreement(SLA)and how many exceed it?
SELECT 
    COUNT(CASE WHEN response_time = 'within SLA' THEN 1 END) AS within_sla,
    COUNT(CASE WHEN response_time = 'above SLA' THEN 1 END) AS above_sla
FROM [Call Center];

-- Why do customers primarily reach out to the call centre?
SELECT reason, COUNT(*) AS count
FROM [Call Center]
GROUP BY reason;

-- How many calls, in terms of total length or volume, does the organization receive through the call centre?
SELECT SUM([call_duration_in_minutes]) AS total_duration
FROM [call center];
 
-- The main reason do customers contact the call centre through chatbots?
SELECT reason, COUNT(*) AS count
FROM [call center]
WHERE channel = 'chatbot'
GROUP BY reason;

-- States with the highest incidence of negative contacts 
SELECT state, COUNT(*) AS count
FROM [call center]
WHERE sentiment = 'very negative'
GROUP BY state
ORDER BY count DESC;

--What is the average duration, in minutes, for calls that exhibit positive sentiment?
SELECT AVG([call_duration_in_minutes]) AS avg_duration
FROM [call center]
WHERE sentiment = 'positive'