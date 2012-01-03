package com.mob.util;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import java.io.PrintWriter;
import java.io.StringWriter;


/**
 * Logger to log the events
 */
public class MOBLogger {

 
    /**
     * Logger Object
     */
    private Logger objLogger;

    /**
     * Property Configurator object
     */
    private static PropertyConfigurator propertyConfig;


    
    /**
     * Constructor accepting the name of the class.
     * @param clazz - Class object of that class
     * @exception none
     */
    public MOBLogger(final Class clazz) {
        if (propertyConfig == null) {
            try {
                //Configure the logger
                if(MOBConstants.getLog4jPath() != null) {
                   PropertyConfigurator.configure(MOBConstants.getLog4jPath());
                }

            } catch (Exception objExp) {
                objExp.printStackTrace();
            }
        }
        objLogger = Logger.getLogger(clazz.getName());
    }

    /**
     * Log meassage as informational
     * @param strMessage - Message
     * @exception none
     */
    public final void info(final String strMessage) {
        if (objLogger.isInfoEnabled()) {
                objLogger.log(MOBLogger.class.getName(), Level.INFO,
                     " - " + strMessage, null);
        }
    }

    /**
     * Log meassage as warning
     * @param strMessage - Message
     * @exception none
     */
    public final void warn(final String strMessage) {
        if (objLogger.isInfoEnabled()) {
                objLogger.log(MOBLogger.class.getName(), Level.WARN,
                    " - " + strMessage, null);
        }
    }

    /**
     * Log meassage as debug
     * @param strMessage - Message
     * @exception none
     */
    public final void debug(final String strMessage) {
                objLogger.log(MOBLogger.class.getName(), Level.DEBUG,
                    " - " + strMessage, null);
        }

    /**
     * Log meassage as error
     * @param strMessage - Message
     * @exception none
     */
    public final void error(final String strMessage) {
            objLogger.log(MOBLogger.class.getName(), Level.ERROR,
                 " - " + strMessage, null);
    }

    /**
     * Log exception
     * @param exp - Exception
     * @exception none
     */
    public final void error(final Exception exp) {
        StringWriter sw = new StringWriter();
        exp.printStackTrace(new PrintWriter(sw));
            objLogger.log(MOBLogger.class.getName(), Level.ERROR,
                 " - " + sw, null);
    }

    /**
     * Log message as fatal.
     * @param strMessage - String
     * @exception none
     */
    public final void fatal(final String strMessage) {
        if (objLogger.isDebugEnabled()) {
                objLogger.log(MOBLogger.class.getName(), Level.FATAL,
                     " - " + strMessage, null);
        }
    }
}
