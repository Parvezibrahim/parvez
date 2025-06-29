{% snapshot snap_orders_check  %}

    {{  
        config(
            target_schema = 'snapshots',
            strategy = 'check',
            unique_key = 'id',
            check_cols = ['user_id','order_date', 'status'],
            invalidate_hard_deletes = True

        )
    }}

    select * from {{source ('parvez','raw_order')}}

{% endsnapshot%}
