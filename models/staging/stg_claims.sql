with claims_source as (
    select *
    from {{ source('stage1', 'travel_claims_raw') }}
)

select
    claim_id,
    customer_id,
    claim_amount,
    claim_date,
    upper(claim_status) as claim_status,
    case 
        when claim_amount > 1000 then 'High'
        when claim_amount >= 500 and claim_amount <= 1000 then 'Medium'
        else 'Low'
end as claim_severity
from claims_source
where claim_id is not null 