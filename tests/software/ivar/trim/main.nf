#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { IVAR_TRIM } from '../../../../software/ivar/trim/main.nf' addParams([:])

workflow test_ivar_trim {
    input = [ [ id:'test'],
              file(params.test_data['sarscov2']['illumina']['test_paired_end_sorted_bam'], checkIfExists: true),
              file(params.test_data['sarscov2']['illumina']['test_paired_end_sorted_bam_bai']", checkIfExists: true) 
            ]
    bed   = file(params.test_data['sarscov2']['genome']['test_bed'], checkIfExists: true)

    IVAR_TRIM ( input, bed_file )
}
