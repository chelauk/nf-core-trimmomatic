#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/trimmomatic
========================================================================================
    Github : https://github.com/nf-core/trimmomatic
    Website: https://nf-co.re/trimmomatic
    Slack  : https://nfcore.slack.com/channels/trimmomatic
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { TRIMMOMATIC } from './workflows/trimmomatic'

//
// WORKFLOW: Run main nf-core/trimmomatic analysis pipeline
//
workflow NFCORE_TRIMMOMATIC {
    TRIMMOMATIC ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_TRIMMOMATIC ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
