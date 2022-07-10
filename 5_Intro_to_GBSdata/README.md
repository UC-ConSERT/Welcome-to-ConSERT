# Some tips on starting with GBS data
 - Brief outline of STACKS with link to manual.
 - Brief outline of reference guided and de novo SNP discovery.
 ```mermaid
 graph TD;
    Raw sequence file-->Demultiplexing and trimming;
    Demultiplexing and trimming-->de novo SNP discovery;
    Demultiplexinga an trimming-->Reference guided SNP discovery;
```