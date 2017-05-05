package com.connectto.guide.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "core_xml_files_updates")
public class XmlFilesUpdate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "russian_files")
    private Date russianFile;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "usa_files")
    private Date usaFile;

    /*##################################################################################################################
     *                                  GETTERS & SETTERS
     *##################################################################################################################
     */

    public long getId() {
        return id;
    }

    public XmlFilesUpdate setId(long id) {
        this.id = id;
        return this;
    }

    public Date getRussianFile() {
        return russianFile;
    }

    public XmlFilesUpdate setRussianFile(Date russianFile) {
        this.russianFile = russianFile;
        return this;
    }

    public Date getUsaFile() {
        return usaFile;
    }

    public XmlFilesUpdate setUsaFile(Date usaFile) {
        this.usaFile = usaFile;
        return this;
    }
}
