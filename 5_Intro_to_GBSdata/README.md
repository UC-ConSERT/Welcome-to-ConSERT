# Tips on starting with GBS data
 - Brief outline of STACKS with link to manual.
 - Brief outline of reference guided and *de novo* SNP discovery.
 ```mermaid
 flowchart TD
    A((Raw Sequence File)) --> B(Demultiplexing and Trimming)
    B(Demultiplexing and Trimming) --> C(de novo SNP Discovery)
    B(Demultiplexing and trimming) --> D(Reference Guided SNP Discovery)
    C(de novo SNP Discovery) --> E(STACKS populations)
    D(Reference Guided SNP Discovery) --> E(STACKS populations)
```