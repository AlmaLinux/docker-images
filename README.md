# AlmaLinux Docker Images

This project contains sources and tools for building official AlmaLinux Docker
images.


## Requirements

You need to install the following RPM packages on an AlmaLinux system:

* anaconda-tui
* lorax
* subscription-manager (make sure the `rhsm` service is running, see [rhbz#1872902](https://bugzilla.redhat.com/show_bug.cgi?id=1872902)) 


## Known issues

You may see the following message in the output:

```
2021-02-05 20:28:10,554: Error in atexit._run_exitfuncs:
2021-02-05 20:28:10,555: Traceback (most recent call last):
2021-02-05 20:28:10,555: File "/usr/lib/python3.6/site-packages/dasbus/client/handler.py", line 477, in _get_method_reply
2021-02-05 20:28:10,557: return self._handle_method_error(error)
2021-02-05 20:28:10,559: File "/usr/lib/python3.6/site-packages/dasbus/client/handler.py", line 497, in _handle_method_error
2021-02-05 20:28:10,560: raise exception from None
2021-02-05 20:28:10,562: dasbus.error.DBusError: umount of /mnt/sysimage/run failed (32)
```

This happens because we need to unmount `/run` in the kickstart file.
It doesn't affect the result, see
[rhbz#1904008](https://bugzilla.redhat.com/show_bug.cgi?id=1904008) for
details.


## References

* https://docs.docker.com/develop/develop-images/baseimages/
* https://github.com/opencontainers/image-spec/blob/master/annotations.md
* https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/system_design_guide/kickstart-script-file-format-reference_system-design-guide


## License

Licensed under the MIT license, see the [LICENSE](LICENSE) file for details.
