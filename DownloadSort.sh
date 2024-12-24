#!/bin/sh


USERHOMEDIR=/home/me

DL=$USERHOMEDIR/Downloads

IMAGEDIR=$DL/images
DATABASEDIR=$DL/databases
ISODIR=$DL/isos
COMPRESSEDDIR=$DL/compressed
DIRECTORYDIR=$DL/directories
TEXTDIR=$DL/texts
FONTDIR=$DL/fonts
MUSICDIR=$DL/music

echo -e "
\e[32mIMAGEDIR      = \e[35m $IMAGEDIR \e[m
\e[32mDATABASEDIR   = \e[35m $DATABASEDIR \e[m
\e[32mISODIR        = \e[35m $ISODIR \e[m
\e[32mCOMPRESSEDDIR = \e[35m $COMPRESSEDDIR \e[m
\e[32mDIRECTORYDIR  = \e[35m $DIRECTORYDIR \e[m
\e[32mTEXTDIR       = \e[35m $TEXTDIR \e[m
\e[32mFONTDIR       = \e[35m $FONTDIR \e[m
\e[32mMUSICDIR      = \e[35m $MUSICDIR \e[m
"

while true
do
	for e in $IMAGEDIR $DATABASEDIR $ISODIR $COMPRESSEDDIR $DIRECTORYDIR $TEXTDIR $FONTDIR $MUSICDIR
	do
		[ ! -d "${e}" ]&& mkdir ${e}; echo -e "\e[35mNew dir ${e}\e[m"
	done
	unset e

	for e in $DL/*
	do
		case ${e} in
			$IMAGEDIR|\
				$DATABASEDIR|\
				$ISODIR|\
				$COMPRESSEDDIR|\
				$DIRECTORYDIR|\
				$TEXTDIR|\
				$FONTDIR|\
				$MUSICDIR) continue;;
			esac

			echo -e "\e[36m${e}\e[m"
			case "$(file "${e}")" in
				*directory*) mv ${e} $DIRECTORYDIR; echo -e "  \e[35m-->\e[32m $DIRECTORYDIR\e[m" ;;
				*image?data*) mv ${e} $IMAGEDIR; echo -e "  \e[35m-->\e[32m $IMAGEDIR\e[m" ;;
				*archive?data* | *compressed?data*) mv ${e} $COMPRESSEDDIR; echo -e "  \e[35m-->\e[32m $COMPRESSEDDIR\e[m" ;;
				*Font?data*) mv ${e} $FONTDIR; echo -e "  \e[35m-->\e[32m $FONTDIR\e[m" ;;
				*text*) mv ${e} $TEXTDIR; echo -e "  \e[35m-->\e[32m $TEXTDIR\e[m" ;;
				*CSV*) mv ${e} $DATABASEDIR; echo -e "  \e[35m-->\e[32m $DATABASEDIR\e[m" ;;
				*ISO*) mv ${e} $ISODIR; echo -e "  \e[35m-->\e[32m $ISODIR\e[m" ;;
				*Audio*) mv ${e} $MUSICDIR; echo -e "  \e[35m-->\e[32m $MUSICDIR\e[m" ;;
			esac
		done
		unset e
		sleep 5s
	done
