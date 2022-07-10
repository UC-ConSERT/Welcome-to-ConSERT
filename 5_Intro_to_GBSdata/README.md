# Some tips on starting with GBS data
 - Brief outline of STACKS with link to manual.
 - Brief outline of reference guided and de novo SNP discovery.
 ```mermaid
 flowchart TD
    A((Raw sequence file)) --> B(Demultiplexing and trimming)
    B(Demultiplexing and trimming) --> C(de novo SNP discovery)
    B(Demultiplexinga an trimming) --> D(Reference guided SNP discovery)
```