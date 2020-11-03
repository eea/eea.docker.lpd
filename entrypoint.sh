#!/bin/bash
rm -rf $JBOSS_HOME/standalone/configuration/standalone_xml_history/current

cp /tmp/standalone.xml $JBOSS_HOME/standalone/configuration/standalone.xml

sed "s#DBCONNECTION_URL#$DBCONNECTION_URL#g" -i $JBOSS_HOME/standalone/configuration/standalone.xml
sed "s#DBCONNECTION_USERNAME#$DBCONNECTION_USERNAME#g" -i $JBOSS_HOME/standalone/configuration/standalone.xml
sed "s#DBCONNECTION_PASSWORD#$DBCONNECTION_PASSWORD#g" -i $JBOSS_HOME/standalone/configuration/standalone.xml

echo SCK_PRIVATE_EXPORT_TEMPLATE=$SCK_PRIVATE_EXPORT_TEMPLATE > $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_PUBLIC_EXPORT_TEMPLATE=$SCK_PUBLIC_EXPORT_TEMPLATE >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_EXPORT_FOLDER=$SCK_EXPORT_FOLDER >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_REPORT_PROVIDER=$SCK_REPORT_PROVIDER >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_REPORT_SUPPORT_MAIL=$SCK_REPORT_SUPPORT_MAIL >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_SUPER_ADMIN=$SCK_SUPER_ADMIN >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_BING_KEY=$SCK_BING_KEY >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_SHAPEFILE_IMPORT_SERVICE_URL=$SCK_SHAPEFILE_IMPORT_SERVICE_URL >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_SHAPEFILE_FOLDER=$SCK_SHAPEFILE_FOLDER >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_SHAPEFILE_TPL_FOLDER=$SCK_SHAPEFILE_TPL_FOLDER >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_DOCUMENTATIONFILE_FOLDER=$SCK_DOCUMENTATIONFILE_FOLDER >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_USER_GUIDE_FOLDER=$SCK_USER_GUIDE_FOLDER >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_ARCHIVE_PROVIDER=$SCK_ARCHIVE_PROVIDER >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_DOCUMENTATION_PROVIDER=$SCK_DOCUMENTATION_PROVIDER >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_TEMPLATE_PROVIDER=$SCK_TEMPLATE_PROVIDER >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_USER_GUIDE_PROVIDER=$SCK_USER_GUIDE_PROVIDER >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_BENEFICIARY_FEATURE_LAYER_URL=$SCK_BENEFICIARY_FEATURE_LAYER_URL >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_BENEFICIARY_PUBLIC_LAYER=$SCK_BENEFICIARY_PUBLIC_LAYER >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_ARCGIS_PROXY=$SCK_ARCGIS_PROXY >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_SPATIAL_REFERENCE=$SCK_SPATIAL_REFERENCE >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_BACKGROUND_LAYER=$SCK_BACKGROUND_LAYER >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo mail.smtp.host=$mail.smtp.host >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo mail.smtp.user=$mail.smtp.user >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_MAIL_SMTP_PASSWORD=$SCK_MAIL_SMTP_PASSWORD >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_MAIL_STMP_FROM_FOR_BENEF=$SCK_MAIL_STMP_FROM_FOR_BENEF >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_MAIL_OUTCOPY=$SCK_MAIL_OUTCOPY >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_MAIL_QC=$SCK_MAIL_QC >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_TABLE_PREFIX=$SCK_TABLE_PREFIX >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_LPD_WEB_APPLICATION=$SCK_LPD_WEB_APPLICATION >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_AUTH=$SCK_AUTH >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_LDAP_URL=$SCK_LDAP_URL >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_LDAP_UID=$SCK_LDAP_UID >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_LDAP_BASE_CONTEXT=$SCK_LDAP_BASE_CONTEXT >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_BENEFICIARY_ACCESS_ACTIVATION_TOKEN_VALIDITY=$SCK_BENEFICIARY_ACCESS_ACTIVATION_TOKEN_VALIDITY >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo SCK_BENEFICIARY_ACCESS_VALIDITY=$SCK_BENEFICIARY_ACCESS_VALIDITY >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo LPD_PRINT_SERVICE=$LPD_PRINT_SERVICE >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo LPD_EXTRACT_SPATIAL_DATA_SERVICE=$LPD_EXTRACT_SPATIAL_DATA_SERVICE >> $JBOSS_HOME/standalone/deployments/lpd_web.properties
echo LPD_SEARCH_LAYER=$LPD_SEARCH_LAYER >> $JBOSS_HOME/standalone/deployments/lpd_web.properties

mv /tmp/artifacts/*.war $JBOSS_HOME/standalone/deployments

exec "$@" 
