# firebase-test-lab-action
Github Action for Firebase Test Lab

Simple way to run instrument test with Firebase Test lab

Minimum declaration sample:

```yaml
  - name: Run tests on Firebase Test Lab for API 33
    uses: vacxe/firebase-test-lab-action@0.0.1
    with:
      apk: apk/sample-debug.apk
      test: apk/sample-debug-androidTest.apk
      device-id: MediumPhone.arm
      os-version-id: 33
    env:
      SERVICE_ACCOUNT: ${{ secrets.FIREBASE_TESTLAB_JSON }}      
```
