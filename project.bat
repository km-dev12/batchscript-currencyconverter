@REM MENGAWALI PROGRAM
:start
@REM memilih mata uang yang akan dikonversi
@echo ================================
@echo +       KONVERSI MATA UANG     +
@echo +          .BAT FILE           +
@echo +Author: Kaka Maulana Abdillah +
@echo +        NPM: 065122029        +
@echo ================================
@echo Pilih mata uang yang ingin dikonversi...
@echo 1. IDR (Indonesia Rupiah)
@echo 2. USD(American Dollars)
@echo 3. GBP (Pound Sterling)
@echo 4. JPY (Japanese Yen)
@echo 5. RM (Ringgit Malaysia)
@echo ================================
set /p p=Masukkan pilihan: 
cls
if /i %p%==1 goto idr
cls
if /i %p%==2 goto usd
cls
if /i %p%==3 goto gbp
cls
if /i %p%==4 goto jpy
cls
if /i %p%==5 goto rm
@REM --- INI KONVERSI DARI MATA UANG INDONESIA RUPIAH (IDR) ---
    :idr
    @echo Indonesian Rupiah (IDR) Converter
    @echo ---------------------------
    @echo Pilih mata uang tujuan konversi
    @echo 1. IDR to USD
    @echo 2. IDR to GBP
    @echo 3. IDR to JPY
    @echo 4. IDR to RM
    set /p p=Masukkan pilihan: 
    cls
    if /i %p%==1 goto idrtousd
    cls
    if /i %p%==2 goto idrtogbp
    cls
    if /i %p%==3 goto idrtojpy
    cls
    if /i %p%==4 goto idrtorm

        :idrtousd
        @echo off
        set usdidr_rate=15200
        set /p idr_amount="Masukkan Nominal Rupiah: "
        echo Nilai kurs USD-IDR: %usdidr_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal Rupiah: %idr_amount%
        set /a result=idr_amount/usdidr_rate
        set /a result_float=(idr_amount-(result*usdidr_rate))*100/usdidr_rate
        echo %idr_amount% Rupiah setara dengan %result%.%result_float% USD
        pause
        goto start

        :idrtogbp
        @echo off
        set gbpidr_rate=18700
        set /p idr_amount="Masukkan Nominal Rupiah: "
        echo Nilai kurs GBP-IDR: %gbpidr_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal Rupiah: %idr_amount%
        set /a result=idr_amount/gbpidr_rate
        set /a result_float=(idr_amount-(result*gbpidr_rate))*100/gbpidr_rate
        echo %idr_amount% Rupiah setara dengan %result%.%result_float% GBP
        pause
        goto start

        :idrtojpy
        @echo off
        set jpyidr_rate=115
        set /p idr_amount="Masukkan Nominal Rupiah: "
        echo Nilai kurs JPY-IDR: %jpyidr_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal Rupiah: %idr_amount%
        set /a result=idr_amount/jpyidr_rate
        set /a result_float=(idr_amount-(result*jpyidr_rate))*100/jpyidr_rate
        echo %idr_amount% Rupiah setara dengan %result%.%result_float% JPY
        pause
        goto start

        :idrtorm
        @echo off
        set rmidr_rate=3400
        set /p idr_amount="Masukkan Nominal Rupiah: "
        echo Nilai kurs RM-IDR: %rmidr_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal Rupiah: %idr_amount%
        set /a result=idr_amount/rmidr_rate
        echo %idr_amount% Rupiah setara dengan %result%.2f RM
        pause
        goto start
@REM --- INI KONVERSI DARI MATA UANG USD (American Dollars) ---
    :usd
    @echo American Dollars (USD) Converter
    @echo ---------------------------
    @echo Pilih mata uang tujuan konversi
    @echo 1. USD to IDR
    @echo 2. USD to GBP
    @echo 3. USD to JPY
    @echo 4. USD to RM
    set /p p=Masukkan pilihan: 
    cls
    if /i %p%==1 goto usdtoidr
    cls
    if /i %p%==2 goto usdtogbp
    cls
    if /i %p%==3 goto usdtojpy
    cls
    if /i %p%==4 goto usdtorm

        :usdtoidr
        @echo off
        setlocal EnableDelayedExpansion
        set idrusd_rate=15200
        set /p usd_amount="Masukkan Nominal USD: "
        echo Nilai kurs USD-IDR: %idrusd_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal USD: %usd_amount%
        set /a result=usd_amount*idrusd_rate

        :: mengubah format hasil konversi menjadi format rupiah menggunakan loop for dan fungsi substring
        set idr_amount=!result!
        set "int=!idr_amount:~0,-3!"
        set "frac=!idr_amount:~-3!"
        if "%int%" equ "" (set int=0)
        set "idr_amount=!int!.!frac!"

        :: menampilkan hasil konversi dalam format rupiah
        echo $%usd_amount% USD setara dengan Rp !idr_amount!
        pause
        goto start

        :usdtogbp
        @echo off
        set gbpusd_rate=1.22
        set /p usd_amount="Masukkan Nominal USD: "
        echo Nilai kurs GBP-USD: %gbpusd_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal USD: %usd_amount%
        set /a result_float=usd_amount*82/100
        echo %usd_amount% USD setara dengan %result_float%.%usd_amount:~-2% GBP
        pause
        goto start

        :usdtojpy
        @echo off
        set usdjpy_rate=130
        set /p usd_amount="Masukkan Nominal USD: "
        echo Nilai kurs USD-JPY: %usdjpy_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal Rupiah: %usd_amount%
        set /a result=usd_amount*usdjpy_rate
        set /a result_float=(usd_amount*usdjpy_rate - result)*100
        echo %usd_amount% USD setara dengan %result%.%result_float% JPY
        pause
        goto start

        :usdtorm
        @echo off
        set usdrm_rate=4.30
        set /p usd_amount="Masukkan Nominal USD: "
        echo Nilai kurs USD-RM: %usdrm_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal Rupiah: %usd_amount%
        set /a result_float=usd_amount*430/100
        echo %usd_amount% USD setara dengan %result_float%.2f RM
        pause
        goto start
@REM --- INI KONVERSI DARI MATA UANG GBP (Pound Sterling) ---
    :gbp
    @echo Pound Sterling (GBP) Converter
    @echo ---------------------------
    @echo Pilih mata uang tujuan konversi
    @echo 1. GBP to IDR
    @echo 2. GBP to USD
    @echo 3. GBP to JPY
    @echo 4. GBP to RM
    set /p p=Masukkan pilihan: 
    cls
    if /i %p%==1 goto gbptoidr
    cls
    if /i %p%==2 goto gbptousd
    cls
    if /i %p%==3 goto gbptojpy
    cls
    if /i %p%==4 goto gbptorm

        :gbptoidr
        setlocal EnableDelayedExpansion
        @echo off
        set gbpidr_rate=18700
        set /p gbp_amount="Masukkan Nominal GBP: "
        echo Nilai kurs GBP-IDR: %gbpidr_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal GBP: %gbp_amount%
        set /a result=gbp_amount*gbpidr_rate

        :: mengubah format hasil konversi menjadi format rupiah menggunakan loop for dan fungsi substring
        set idr_amount=!result!
        set "int=!idr_amount:~0,-3!"
        set "frac=!idr_amount:~-3!"
        if "%int%" equ "" (set int=0)
        set "idr_amount=!int!.!frac!"

        :: menampilkan hasil konversi dalam format rupiah
        echo %gbp_amount% GBP setara dengan Rp !idr_amount!
        pause
        goto start
        
        :gbptousd
        @echo off
        set gbpusd_rate=0.82
        set /p gbp_amount="Masukkan Nominal GBP: "
        echo Nilai kurs GBP-USD: %gbpusd_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal GBP: %gbp_amount%
        set /a result=%gbp_amount%*82/100
        set /a result_float=%gbp_amount%*82%%100
        if %result_float% lss 10 (
            echo %result%.0%result_float% USD
        ) else (
            echo %result%.%result_float% USD
        )
        pause
        goto start

        :gbptojpy
        @echo off
        set gbpjpy_rate=160
        set /p gbp_amount="Masukkan Nominal GBP: "
        echo Nilai kurs GBP-JPY: %gbpjpy_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal Rupiah: %gbp_amount%
        set /a result=gbp_amount*gbpjpy_rate
        set /a result_float=(gbp_amount*gbpjpy_rate - result)*100
        echo %gbp_amount% Rupiah setara dengan %result%.%result_float% JPY
        pause
        goto start

        :gbptorm
        @echo off
        set gbprm_rate=5.30
        set /p gbp_amount="Masukkan Nominal GBP: "
        echo Nilai kurs GBP-RM: %gbprm_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal GBP: %gbp_amount%
        set /a result_float=gbp_amount*530/100
        echo %gbp_amount% GBP setara dengan %result_float%.2f RM
        pause
        goto start
@REM --- INI KONVERSI DARI MATA UANG JPY (Japanese Yen) ---
    :jpy
    @echo Japanese Yen (JPY) Converter
    @echo ---------------------------
    @echo Pilih mata uang tujuan konversi
    @echo 1. JPY to IDR
    @echo 2. JPY to USD
    @echo 3. JPY to GBP
    @echo 4. JPY to RM
    set /p p=Masukkan pilihan: 
    cls
    if /i %p%==1 goto jpytoidr
    cls
    if /i %p%==2 goto jpytousd
    cls
    if /i %p%==3 goto jpytogbp
    cls
    if /i %p%==4 goto jpytorm

        :jpytoidr
        setlocal EnableDelayedExpansion
        @echo off
        set jpyidr_rate=115
        set /p jpy_amount="Masukkan Nominal JPY: "
        echo Nilai kurs JPY-IDR: %usdidr_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal JPY: %jpy_amount%
        set /a result=jpy_amount*jpyidr_rate
        :: mengubah format hasil konversi menjadi format rupiah menggunakan loop for dan fungsi substring
        set idr_amount=!result!
        set "int=!idr_amount:~0,-3!"
        set "frac=!idr_amount:~-3!"
        if "%int%" equ "" (set int=0)
        set "idr_amount=!int!.!frac!"

        :: menampilkan hasil konversi dalam format rupiah
        echo %jpy_amount% JPY setara dengan Rp !idr_amount!
        pause
        goto start

        :jpytousd
        @echo off
        set jpyusd_rate=130
        set /p jpy_amount="Masukkan Nominal JPY: "
        echo Nilai kurs JPY-USD: %jpyusd_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal Rupiah: %jpy_amount%
        set /a result=jpy_amount/%jpyusd_rate%
        set /a result_float=(jpy_amount*jpyusd_rate - result)*100
        echo %jpy_amount% JPY setara dengan %result%.%result_float% USD
        pause
        goto start

        :jpytogbp
        @echo off
        set jpygbp_rate=160
        set /p jpy_amount="Masukkan Nominal JPY: "
        echo Nilai kurs JPY-GBP: %jpygbp_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal Rupiah: %jpy_amount%
        set /a result=jpy_amount/%jpygbp_rate%
        set /a result_float=(jpy_amount*jpygbp_rate - result)*100
        echo %jpy_amount% JPY setara dengan %result%.%result_float% GBP
        pause
        goto start

        :jpytorm
        @echo off
        set rmjpy_rate=29
        set /p jpy_amount="Masukkan Nominal JPY: "
        echo Nilai kurs RM-JPY: %rmjpy_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal JPY: %jpy_amount%
        set /a result_float=jpy_amount*34/1000
        echo %jpy_amount% JPY setara dengan %result_float%.2f RM
        pause
        goto start
@REM --- INI KONVERSI DARI MATA UANG RM (Ringgit Malaysia) ---
    :rm
    @echo Ringgit Malaysia (RM) Converter
    @echo ---------------------------
    @echo Pilih mata uang tujuan konversi
    @echo 1. RM to IDR
    @echo 2. RM to USD
    @echo 3. RM to GBP
    @echo 4. RM to JPY
    set /p p=Masukkan pilihan: 
    cls
    if /i %p%==1 goto rmtoidr
    cls
    if /i %p%==2 goto rmtousd
    cls
    if /i %p%==3 goto rmtogbp
    cls
    if /i %p%==4 goto rmtojpy

        :rmtoidr
        setlocal EnableDelayedExpansion
        @echo off
        set rmidr_rate=3400
        set /p rm_amount="Masukkan Nominal RM: "
        echo Nilai kurs RM-IDR: %rmidr_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal RM: %rm_amount%
        set /a result=rm_amount*rmidr_rate
        :: mengubah format hasil konversi menjadi format rupiah menggunakan loop for dan fungsi substring
        set idr_amount=!result!
        set "int=!idr_amount:~0,-3!"
        set "frac=!idr_amount:~-3!"
        if "%int%" equ "" (set int=0)
        set "idr_amount=!int!.!frac!"

        :: menampilkan hasil konversi dalam format rupiah
        echo %rm_amount% RM setara dengan Rp !idr_amount!
        pause
        goto start

        :rmtousd
        @echo off
        set usdrm_rate=4.30
        set /p rm_amount="Masukkan Nominal RM : "
        echo Nilai kurs USD-RM: %usdrm_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal Rupiah: %usd_amount%
        set /a result=rm_amount*(430/100)
        echo %rm_amount% RM setara dengan %result% USD
        pause
        goto start

        :rmtogbp
        @echo off
        set gbprm_rate=5.30
        set /p rm_amount="Masukkan Nominal GBP: "
        echo Nilai kurs GBP-RM: %gbprm_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal RM: %rm_amount%
        set /a result=rm_amount*(530/100)
        set /a result_float=(rm_amount*gbprm_rate - result)*100
        echo %rm_amount% RM setara dengan %result%.%result_float% GBP
        pause
        goto start

        :rmtojpy
        @echo off
        set rmjpy_rate=29.0
        set /p jpy_amount="Masukkan Nominal JPY: "
        echo Nilai kurs RM-JPY: %rmjpy_rate% (kurs tidak realtime/tanpa API)
        echo Nilai nominal JPY: %jpy_amount%
        set /a result_float=jpy_amount*29
        echo %jpy_amount% RM setara dengan %result_float%.2f JPY
        pause
        goto start
        goto start
:keluar
pause
exit
