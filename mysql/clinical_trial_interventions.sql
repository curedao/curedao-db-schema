create table clinical_trial_interventions
(
    id                int auto_increment
        primary key,
    nct_id            varchar(4369) null,
    intervention_type varchar(4369) null,
    name              varchar(4369) null,
    description       text          null,
    global_variable_id       int unsigned  null,
    constraint ctg_interventions_gv_id_uindex
        unique (global_variable_id),
    constraint ctg_interventions_variables_id_fk
        foreign key (global_variable_id) references global_variables (id)
)
    comment 'Interventions from clinicaltrials.gov' charset = latin1;

