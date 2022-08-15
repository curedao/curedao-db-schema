create table intuitive_treatment_side_effect
(
    id                      int auto_increment
        primary key,
    treatment_global_variable_id   int unsigned                        not null,
    side_effect_global_variable_id int unsigned                        not null,
    treatment_id            int                                 not null,
    side_effect_id          int                                 not null,
    votes_percent           int                                 not null,
    updated_at              timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment 'When the DB record was last updated.',
    created_at              timestamp            default CURRENT_TIMESTAMP  not null comment 'When the DB record was first created',
    deleted_at              timestamp                           null,
    constraint treatment_id_side_effect_id_uindex
        unique (treatment_id, side_effect_id),
    constraint treatment_gv_id_side_effect_gv_id_uindex
        unique (treatment_global_variable_id, side_effect_global_variable_id),
    constraint side_effect_variables_id_fk
        foreign key (side_effect_global_variable_id) references global_variables (id),
    constraint treatment_side_effect_side_effects_id_fk
        foreign key (side_effect_id) references intuitive_side_effects (id),
    constraint treatment_side_effect_treatments_id_fk
        foreign key (treatment_id) references intuitive_treatments (id),
    constraint treatment_variables_id_fk
        foreign key (treatment_global_variable_id) references global_variables (id)
)
    comment 'User self-reported treatments and side-outcomes' charset = utf8;

