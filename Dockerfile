FROM debian:stretch

RUN apt update && apt install -y \
        autoconf \
        bioperl \
        build-essential \
        cmake \
        default-jre \
        git \
        libbz2-dev \
        libdatetime-perl \
        libdigest-md5-perl \
        liblzma-dev \
        libxml-simple-perl \
        libz-dev \
        locales \
        pigz \
        python \
        python-dev \
        python-pip \
        python3 \
        python3-dev \
        python3-pip \
        unzip \
        wget \
        && rm -rf /var/lib/apt

# Install CheckM

RUN pip install numpy && pip install checkm-genome

RUN wget "https://data.ace.uq.edu.au/public/CheckM_databases/checkm_data_2015_01_16.tar.gz"

RUN mkdir -p /opt/checkm; mv checkm_data_2015_01_16.tar.gz /opt/checkm/ && tar -xzf /opt/checkm/checkm_data_2015_01_16.tar.gz

RUN echo -e "cat << EOF\n/opt/checkm\nEOF\n" | checkm data setRoot

# Install cutadapt

RUN pip3 install click cutadapt==1.16

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install BWA

ENV BWA_VERSION 0.7.17

RUN git clone https://github.com/lh3/bwa.git

RUN cd bwa; git checkout v${BWA_VERSION} && make

RUN mv bwa/bwa /usr/local/bin/ && rm -r bwa

# Install FLASh

ENV FLASH_VERSION 1.2.11

RUN wget "http://ccb.jhu.edu/software/FLASH/FLASH-${FLASH_VERSION}-Linux-x86_64.tar.gz"

RUN tar -xzf FLASH-${FLASH_VERSION}-Linux-x86_64.tar.gz

RUN mv FLASH-${FLASH_VERSION}-Linux-x86_64/flash /usr/local/bin/ && rm -r FLASH*

# Install KMC

ENV KMC_VERSION 3.1.0

RUN git clone https://github.com/refresh-bio/KMC.git

RUN cd KMC; git checkout v${KMC_VERSION} && make DISABLE_ASMLIB=true

RUN mv KMC/bin/* /usr/local/bin/ && rm -r KMC

# Install Lighter

ENV LIGHTER_VERSION 1.1.1

RUN git clone https://github.com/mourisl/Lighter.git

RUN cd Lighter; git checkout v${LIGHTER_VERSION} && make

RUN mv Lighter/lighter /usr/local/bin/ && rm -r Lighter

# Install htslib

ENV HTSLIB_VERSION 1.8

RUN git clone https://github.com/samtools/htslib.git

RUN cd htslib; git checkout ${HTSLIB_VERSION} && \
        autoheader && \
        autoconf -Wno-syntax && \
        ./configure --prefix=/usr/local && \
        make && \
        make install

RUN rm -r htslib

# Install samtools

ENV SAMTOOLS_VERSION 1.8

RUN git clone https://github.com/samtools/samtools.git

RUN cd samtools; git checkout ${SAMTOOLS_VERSION} && \
        autoheader && \
        autoconf -Wno-syntax && \
        ./configure --prefix=/usr/local --without-curses && \
        make && \
        make install

RUN rm -r samtools

# Install SPAdes

ENV SPADES_VERSION 3.11.1

RUN wget "http://cab.spbu.ru/files/release${SPADES_VERSION}/SPAdes-${SPADES_VERSION}.tar.gz"

RUN tar -xzvf SPAdes-${SPADES_VERSION}.tar.gz

RUN mkdir -p /SPAdes-${SPADES_VERSION}/src/build

RUN cd SPAdes-${SPADES_VERSION}/src/build; cmake .. && \
        make install

RUN rm -r SPAdes-${SPADES_VERSION}*

# Install seqtk

ENV SEQTK_VERSION 1.3

RUN git clone https://github.com/lh3/seqtk.git

RUN cd seqtk; git checkout v${SEQTK_VERSION} && make

RUN mv seqtk/seqtk /usr/local/bin/ && rm -r seqtk

# Install shovill

ENV SHOVILL_VERSION 0.9.0

RUN git clone https://github.com/tseemann/shovill.git /usr/local/shovill

RUN cd /usr/local/shovill; git checkout v${SHOVILL_VERSION}

ENV PATH $PATH:/usr/local/shovill/bin

# Install Prokka

ENV PROKKA_VERSION d6adb2c7

RUN cpan Bio::Perl

RUN git clone https://github.com/tseemann/prokka.git /usr/local/prokka

RUN cd /usr/local/prokka; git checkout ${PROKKA_VERSION}

ENV PATH $PATH:/usr/local/prokka/bin

RUN prokka --setupdb

# Install racon

ENV RACON_VERSION 1.3.1

RUN git clone --recursive https://github.com/isovic/racon.git

RUN mkdir -p racon/build

RUN cd racon/build; git checkout ${RACON_VERSION} && \
        cmake -DCMAKE_BUILD_TYPE=Release .. && \
        make && \
        make install

RUN rm -r racon*

# Install bowtie2

ENV BOWTIE2_VERSION 2.3.4.1

RUN wget "https://github.com/BenLangmead/bowtie2/releases/download/v${BOWTIE2_VERSION}/bowtie2-${BOWTIE2_VERSION}-linux-x86_64.zip"

RUN unzip bowtie2-${BOWTIE2_VERSION}-linux-x86_64.zip

RUN mv bowtie2-${BOWTIE2_VERSION}-linux-x86_64/bowtie2* /usr/local/bin/

RUN rm -r bowtie2*

# Install Unicycler

ENV UNICYCLER_VERSION 0.4.6

ENV TERM=xterm

RUN git clone https://github.com/rrwick/Unicycler.git

RUN cd Unicycler; git checkout v${UNICYCLER_VERSION} && python3 setup.py install

RUN rm -r Unicycler

# Install Pilon

# REMEMBER: Update this in pilon.sh as well

ENV PILON_VERSION 1.22

RUN wget "https://github.com/broadinstitute/pilon/releases/download/v${PILON_VERSION}/pilon-${PILON_VERSION}.jar"

RUN mkdir -p /usr/local/pilon && mv pilon-${PILON_VERSION}.jar /usr/local/pilon/

ADD pilon.sh /usr/local/bin/pilon

RUN chmod +x /usr/local/bin/pilon

# Install trimmomatic

# REMEMBER: Update this in trimmomatic.sh as well

ENV TRIMMOMATIC_VERSION 0.38

RUN wget "http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-${TRIMMOMATIC_VERSION}.zip"

RUN unzip Trimmomatic-${TRIMMOMATIC_VERSION}.zip

RUN mkdir -p /usr/local/trimmomatic && mv /Trimmomatic-${TRIMMOMATIC_VERSION}/trimmomatic-${TRIMMOMATIC_VERSION}.jar /usr/local/trimmomatic/

ADD trimmomatic.sh /usr/local/bin/trimmomatic

RUN chmod +x /usr/local/bin/trimmomatic

RUN rm -r Trimmomatic*

# Install Bandage

ENV BANDAGE_VERSION 0.8.1

RUN ["/bin/bash", "-c", "wget \"https://github.com/rrwick/Bandage/releases/download/v${BANDAGE_VERSION}/Bandage_Ubuntu_static_v${BANDAGE_VERSION//./_}.zip\""]

RUN ["/bin/bash", "-c", "unzip Bandage_Ubuntu_static_v${BANDAGE_VERSION//./_}.zip -d Bandage"]

RUN ["/bin/bash", "-c", "mv /Bandage/Bandage /usr/local/bin/"]

RUN rm -r Bandage*
