// NOTE: Append the lines below to ios/Classes/<your>Plugin.h

char *calc(const unsigned char *input,
           int input_len,
           short par1,
           short par2,
           const unsigned char *trans,
           const unsigned char *version,
           int version_len);

char *versionInterface(void);
