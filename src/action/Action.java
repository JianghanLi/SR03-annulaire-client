/**
 * Action.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package action;

public interface Action extends java.rmi.Remote {
    public java.lang.String test() throws java.rmi.RemoteException;
    public java.lang.String searchByCategorie(java.lang.String categorie) throws java.rmi.RemoteException;
    public void newAnnonce(java.lang.String categorie, java.lang.String nom, java.lang.String rue, java.lang.String ville, java.lang.String postal, java.lang.String tele, java.lang.String text) throws java.rmi.RemoteException;
    public void modifyAnnonce(java.lang.String categorie, java.lang.String nom, java.lang.String rue, java.lang.String ville, java.lang.String postal, java.lang.String tele, java.lang.String text, int id_annonce) throws java.rmi.RemoteException;
    public void deleteAnnonce(int id_annonce) throws java.rmi.RemoteException;
    public void newCategorie(java.lang.String categorie) throws java.rmi.RemoteException;
    public void modifyCategorie(java.lang.String categorie, java.lang.String newCategorie) throws java.rmi.RemoteException;
    public void deleteCategorie(java.lang.String categorie) throws java.rmi.RemoteException;
    public java.lang.String searchByCodepostal(java.lang.String codePostal) throws java.rmi.RemoteException;
    public java.lang.String searchByNom(java.lang.String nom) throws java.rmi.RemoteException;
}
