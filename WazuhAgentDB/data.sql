-- 1. Generate 20 agents
INSERT INTO agents (name, ip, active, date)
SELECT
    'agent-' || gs,
    '10.0.0.' || gs,
    (random() > 0.2),
    NOW() - (random() * INTERVAL '30 days')
FROM generate_series(1,20) gs;


-- 2. Generate 10 critical vulnerabilities
INSERT INTO vulnerabilities (name, severity)
SELECT
    'Critical Vulnerability ' || gs,
    'Critical'
FROM generate_series(1,10) gs;


-- 3. Generate 50 vulnerability status records with different dates
INSERT INTO vulnerability_status (agent, vulnerability, date)
SELECT
    (SELECT id FROM agents ORDER BY random() LIMIT 1),
    (SELECT id FROM vulnerabilities WHERE severity = 'Critical' ORDER BY random() LIMIT 1),
    NOW() - (gs * INTERVAL '1 day')
FROM generate_series(1,50) gs;